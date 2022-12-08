import 'package:injectable/injectable.dart';

import '../../base/bloc/base_cubit.dart';
import '../../models/settings/settings_model.dart';
import '../../services/package_info/package_info_service.dart';
import '../../services/store/user/user_store_service.dart';

part 'settings_state.dart';

@injectable
class SettingsCubit extends BaseCubit<SettingsState> {
  final PackageInfoService _packageInfoService;
  final UserStoreService _userStoreService;

  SettingsCubit(
    this._packageInfoService,
    this._userStoreService,
  ) : super(const SettingsState());

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
    await _getUserName();
  }

  Future<String> _getAppVersion() async {
    final data = await _packageInfoService.getPackageInfo();
    return data.version;
  }

  Future<void> _getUserName() async {
    await performSafeAction(() async {
      final userName = await _userStoreService.get();
      final settings = state.settings.copyWith(userName: userName);
      emit(state.copyWith(settings: settings));
    });
  }

  void saveUsername(String text) async {
    await performSafeAction(() async {
      await _userStoreService.save(text);
      emit(SettingsStateUsernameSaved.copyFromState(state));
    });
    await _getUserName();
  }
}
