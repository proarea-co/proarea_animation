import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../../../api/retrofit/app_api.dart';
import '../../../models/user.dart';
import '../../base/base_service.dart';

@injectable
@immutable
class UsersService extends BaseService {
  final AppApi _appApi;
  const UsersService(this._appApi);

  Future<List<User>> getUsers() async {
    return makeErrorParsedCall(() async => _appApi.getUsers());
  }
}
