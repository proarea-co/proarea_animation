import 'package:injectable/injectable.dart';

import '../../base/bloc/base_cubit.dart';
import '../../models/settings/settings_model.dart';

part 'settings_state.dart';

@injectable
class SettingsCubit extends BaseCubit<SettingsState> {
  SettingsCubit() : super(const SettingsState());

  @override
  void handleError(String massage) {
    emit(state.copyWith(
      status: StateStatus.error,
      message: massage,
    ));
  }
}
