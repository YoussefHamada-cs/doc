import 'package:dio/dio.dart';
import 'package:duc/core/errors/error_model.dart';

class ServerException implements Exception {
  final ErrorModel errorModel;

  ServerException({required this.errorModel});
}

void handleExcptions(DioException e) {
  // Helper function to safely parse the error model
  ErrorModel getModel(dynamic data) {
    if (data != null && data is Map<String, dynamic>) {
      return ErrorModel.fromJson(data);
    } else {
      // Fallback if the server response is null or not a map
      return ErrorModel(
        message: "Connection failed. Please check your internet and try again.",
        status: false,
      );
    }
  }

  switch (e.type) {
    case DioExceptionType.badResponse:
      // Server responded with a status code (400, 401, 422, 500...)
      switch (e.response?.statusCode) {
        case 400:
        case 401:
        case 403:
        case 404:
        case 409:
        case 422:
        case 500:
        case 504:
          throw ServerException(errorModel: getModel(e.response?.data));
        default:
          throw ServerException(errorModel: getModel(e.response?.data));
      }

    case DioExceptionType.connectionTimeout:
    case DioExceptionType.sendTimeout:
    case DioExceptionType.receiveTimeout:
      throw ServerException(
        errorModel: ErrorModel(message: "Connection timed out. Please try again.", status: false),
      );

    case DioExceptionType.connectionError:
      throw ServerException(
        errorModel: ErrorModel(message: "No internet connection. Please check your network.", status: false),
      );

    case DioExceptionType.cancel:
      throw ServerException(
        errorModel: ErrorModel(message: "Request was cancelled.", status: false),
      );

    case DioExceptionType.badCertificate:
      throw ServerException(
        errorModel: ErrorModel(message: "Security certificate error.", status: false),
      );

    case DioExceptionType.unknown:
    // Handles "Connection closed before full header was received" and other unexpected issues
      throw ServerException(
        errorModel: ErrorModel(message: "An unknown error occurred. Please try later.", status: false),
      );
  }
}