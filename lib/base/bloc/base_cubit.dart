import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'base_state.dart';

abstract class BaseCubit<State extends BaseState> extends Cubit<State> {
  BaseCubit(State initialState) : super(initialState);

  void handleError(String massage);

  Future<T?> performSafeAction<T>(
    AsyncValueGetter<T> callback,
  ) async {
    try {
      return await callback();
    } catch (exception) {
      handleError('$exception');
      return null;
    }
  }
}
