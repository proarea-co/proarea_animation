part of 'settings_cubit.dart';

class SettingsState extends BaseState {
  final SettingsModel settings;

  const SettingsState({
    super.status,
    super.message,
    this.settings = const SettingsModel(),
  });

  @override
  List<Object?> get props {
    return [
      ...super.props,
      settings,
    ];
  }

  SettingsState copyWith({
    StateStatus? status,
    String? message,
    SettingsModel? settings,
  }) {
    return SettingsState(
      status: status ?? this.status,
      message: message ?? this.message,
      settings: settings ?? this.settings,
    );
  }
}
