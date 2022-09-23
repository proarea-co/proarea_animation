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
          requestBody: true,
          error: true,
          requestHeader: true,
          compact: true,
        ),
      ]);
  }
}
