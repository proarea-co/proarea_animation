import 'package:injectable/injectable.dart';

import '../../base/bloc/base_cubit.dart';
import '../../models/settings/settings_model.dart';
import '../../services/package_info/package_info_service.dart';

part 'settings_state.dart';

@injectable
class SettingsCubit extends BaseCubit<SettingsState> {
  final PackageInfoService _packageInfoService;

  SettingsCubit(this._packageInfoService) : super(const SettingsState());

  @override
  void handleError(String massage) {
    emit(state.copyWith(
      status: StateStatus.error,
      message: massage,
    ));
  }

  Future<void> init() async {
    emit(state.copyWith(
      settings: state.settings.copyWith(
        appVersion: await _getAppVersion(),
      ),
    ));
  }

  Future<String> _getAppVersion() async {
    final data = await _packageInfoService.getPackageInfo();
    return data.version;
  }
}
