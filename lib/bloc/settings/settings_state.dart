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

class SettingsStateUsernameSaved extends SettingsState{
  const SettingsStateUsernameSaved({
    super.status,
    super.message,
    super.settings,
  });

  static SettingsStateUsernameSaved copyFromState(SettingsState state) {
    return SettingsStateUsernameSaved(
      status: state.status,
      message: state.message,
      settings: state.settings,
    );
  }
}
