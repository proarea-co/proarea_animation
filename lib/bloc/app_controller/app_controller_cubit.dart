import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../../base/bloc/base_cubit.dart';
import '../../l10n/localization_helper.dart';
import '../../services/store/locale/locale_store_service.dart';
import '../../services/theme/theme_service.dart';
import '../../themes/theme_app.dart';
part 'app_controller_state.dart';

@injectable
class AppControllerCubit extends BaseCubit<AppControllerState> {
  final LocaleStoreService localeService;
  final ThemeService themeService;

  AppControllerCubit(
    this.localeService,
    this.themeService,
  ) : super(const AppControllerState());

  Future<void> init() async {
    emit(state.copyWith(
      locale: await _getLocale(),
      themeType: await themeService.getTheme(),
    ));
  }

  Future<void> changeLanguage(Locale locale) async {
    helpLocale = locale;
    emit(state.copyWith(locale: locale));
    await localeService.saveLocale(locale);
  }

  Future<void> changeTheme(ThemeType themeType) async {
    emit(state.copyWith(themeType: themeType));
    await themeService.saveTheme(themeType);
  }

  Future<Locale?> _getLocale() async {
    final locale = await localeService.getLocale();
    helpLocale = locale;
    return locale;
  }

  @override
  void handleError(String massage) {
    emit(state.copyWith(
      status: StateStatus.error,
      massage: massage,
    ));
  }
}
