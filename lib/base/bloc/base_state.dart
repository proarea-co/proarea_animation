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
  final String message;

  const BaseState({
    this.status = StateStatus.initial,
    this.message = '',
  });

  @override
  List<Object?> get props {
    return [
      status,
      message,
    ];
  }
}
