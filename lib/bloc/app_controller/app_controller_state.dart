part of 'app_controller_cubit.dart';

@immutable
class AppControllerState extends BaseState {
  final Locale locale;
  final ThemeType themeType;

  const AppControllerState({
    super.status,
    super.message,
    this.locale = const Locale('en'),
    this.themeType = ThemeType.light,
  });

  @override
  List<Object?> get props {
    return [
      ...super.props,
      locale,
      themeType,
    ];
  }

  AppControllerState copyWith({
    StateStatus? status,
    String? massage,
    Locale? locale,
    ThemeType? themeType,
  }) {
    return AppControllerState(
      status: status ?? super.status,
      message: massage ?? super.message,
      locale: locale ?? this.locale,
      themeType: themeType ?? this.themeType,
    );
  }
}
