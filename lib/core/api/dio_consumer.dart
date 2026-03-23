import 'package:dio/dio.dart';
import 'package:duc/core/api/api_consumer.dart';
import 'package:duc/core/api/api_interceptors.dart';
import 'package:duc/core/api/end_point.dart';
import 'package:duc/core/errors/exception.dart';

class DioConsumer extends ApiConsumer {
  final Dio dio;

  DioConsumer({required this.dio}) {
    dio.options.baseUrl = EndPoint.baseUrl;

    dio.options.connectTimeout = const Duration(seconds: 10);

    dio.options.receiveTimeout = const Duration(seconds: 15);

    dio.options.sendTimeout = const Duration(seconds: 15);
    dio.interceptors.add(ApiInterceptors());
    dio.interceptors.add(
      LogInterceptor(
        request: true,
        requestHeader: true,
        requestBody: true,
        responseHeader: true,
        responseBody: true,
        error: true,
      ),
    );
  }

  @override
  Future get(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryparameters,
    bool isFormData = false,
  }) async {
    try {
      final response = await dio.get(
        path,
        data: isFormData ? FormData.fromMap(data) : data,
        queryParameters: queryparameters,
      );
      return response.data;
    } on DioException catch (e) {
      handleExcptions(e);
    }
  }

  @override
  Future post(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryparameters,
    bool isFormData = false,
  }) async {
    try {
      final response = await dio.post(
        path,
        data: isFormData ? FormData.fromMap(data) : data,
        queryParameters: queryparameters,
      );
      return response.data;
    } on DioException catch (e) {
      handleExcptions(e);
    }
  }
}
