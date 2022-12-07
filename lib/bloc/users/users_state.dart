part of 'users_cubit.dart';

@immutable
class UsersState extends BaseState {
  final List<User> users;
  final int userIndex;

  const UsersState({
    super.status,
    super.message,
    this.users = const [],
    this.userIndex = 0,
  });

  @override
  List<Object?> get props {
    return [
      ...super.props,
      users,
      userIndex,
    ];
  }

  UsersState copyWith({
    StateStatus? status,
    String? massage,
    List<User>? users,
    int? userIndex,
  }) {
    return UsersState(
      status: status ?? super.status,
      message: massage ?? super.message,
      users: users ?? this.users,
      userIndex: userIndex ?? this.userIndex,
    );
  }
}
