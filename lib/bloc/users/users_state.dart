part of 'users_cubit.dart';

@immutable
class UsersState extends BaseState {
  final List<User> users;

  const UsersState({
    super.status,
    super.message,
    this.users = const [],
  });

  @override
  List<Object?> get props {
    return [
      ...super.props,
      users,
    ];
  }

  UsersState copyWith({
    StateStatus? status,
    String? massage,
    List<User>? users,
  }) {
    return UsersState(
      status: status ?? super.status,
      message: massage ?? super.message,
      users: users ?? this.users,
    );
  }
}
