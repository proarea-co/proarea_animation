import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../../services/token/token_service.dart';
import 'dio_constants.dart';

@module
@immutable
abstract class DioModule {
  @lazySingleton
  Dio client(TokenService tokenService) {
    return Dio(
      BaseOptions(
        baseUrl: ApiConstants.baseUrl,
      ),
    )..interceptors.addAll([
        PrettyDioLogger(
          requestHeader: true,
          requestBody: false,
          responseBody: true,
        ),
        InterceptorsWrapper(
          onRequest: (
            RequestOptions options,
            RequestInterceptorHandler handler,
          ) async {
            final token = await tokenService.getToken();
            options.headers['Authorization'] = 'Bearer $token';
            if (kDebugMode) print(token);
            return handler.next(options);
          },
        ),
      ]);
  }
}
