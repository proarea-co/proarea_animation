import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../../../api/retrofit/app_api.dart';
import '../../../di/di.dart';
import '../../../mock/mock_users.dart';
import '../../../models/user.dart';
import '../../base/base_service.dart';

@immutable
abstract class UsersService extends BaseService {
  const UsersService();

  Future<List<User>> getUsers();
}

@Injectable(as: UsersService, env: [Environment.dev])
@immutable
class UsersServiceDev extends UsersService {
  final AppApi _appApi;
  const UsersServiceDev(this._appApi);

  @override
  Future<List<User>> getUsers() async {
    return makeErrorParsedCall(() async => _appApi.getUsers());
  }
}

@Injectable(as: UsersService, env: [EnvironmentExtension.mock])
@immutable
class UsersServiceMock extends UsersService {
  @override
  Future<List<User>> getUsers() async {
    return makeErrorParsedCall(() async {
      return mockUsers.map((json) => User.fromJson(json)).toList();
    });
  }
}
