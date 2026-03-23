import 'package:dio/dio.dart';
import 'package:duc/core/api/end_point.dart';

class ApiInterceptors extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers['Accept'] = 'application/json';
    //options.headers[ApiKey.token];
    super.onRequest(options, handler);
  }
}
