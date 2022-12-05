part of 'home_cubit.dart';

class HomeState extends BaseState {
  final List<TabItem> tabs;
  final bool canBeDragged;

  const HomeState({
    super.status,
    super.message,
    this.tabs = const [],
    this.canBeDragged = false,
  });

  @override
  List<Object?> get props {
    return [
      ...super.props,
      tabs,
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
      tabs: tabs ?? this.tabs,
      canBeDragged: canBeDragged ?? this.canBeDragged,
    );
  }

  List<PageRouteInfo<dynamic>> get routes {
    return tabs.map((tab) => tab.rout).toList();
  }
}
