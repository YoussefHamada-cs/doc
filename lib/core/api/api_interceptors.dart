import 'package:dio/dio.dart';

import 'package:duc/core/api/end_point.dart';
import 'package:duc/core/helper/cache_helper.dart';

class ApiInterceptors extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers['Accept'] = 'application/json';
    final String? token = CacheHelper().getData(key: ApiKey.token);
    if (token != null) {
      options.headers['Authorization'] = 'Bearer $token';
    }

    super.onRequest(options, handler);
  }
}
