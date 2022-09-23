part of 'base_cubit.dart';

enum StateStatus {
  initial,
  loading,
  refresh,
  loaded,
  info,
  error,
}

@immutable
abstract class BaseState extends Equatable {
  final StateStatus status;
  final String massage;

  const BaseState({
    this.status = StateStatus.initial,
    this.massage = '',
  });

  @override
  List<Object?> get props {
    return [
      status,
      massage,
    ];
  }
}
