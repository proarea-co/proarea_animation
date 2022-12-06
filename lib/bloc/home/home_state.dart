part of 'home_cubit.dart';

class HomeState extends BaseState {
  final bool canBeDragged;

  const HomeState({
    super.status,
    super.message,
    this.canBeDragged = false,
  });

  @override
  List<Object?> get props {
    return [
      ...super.props,
      canBeDragged,
    ];
  }

  HomeState copyWith({
    StateStatus? status,
    String? message,
    List<TabItem>? tabs,
    bool? canBeDragged,
  }) {
    return HomeState(
      status: status ?? this.status,
      message: message ?? this.message,
      canBeDragged: canBeDragged ?? this.canBeDragged,
    );
  }
}
