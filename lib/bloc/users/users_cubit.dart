import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../../base/bloc/base_cubit.dart';
import '../../models/user.dart';
import '../../services/api/users/users_service.dart';

part 'users_state.dart';

@injectable
class UsersCubit extends BaseCubit<UsersState> {
  final UsersService _usersService;

  UsersCubit(
    this._usersService,
  ) : super(const UsersState());

  Future<void> getUsers() async {
    emit(state.copyWith(status: StateStatus.loading));
    await performSafeAction(() async {
      emit(state.copyWith(
        status: StateStatus.loaded,
        users: await _usersService.getUsers(),
      ));
    });
  }

  @override
  void handleError(String massage) {
    emit(state.copyWith(
      status: StateStatus.error,
      massage: massage,
    ));
  }
}
