import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../l10n/localization_helper.dart';

@injectable
class LocaleService {
  static const _localeKey = 'locale';
  Future<SharedPreferences> get _storage => SharedPreferences.getInstance();

  Future<void> saveLocale(Locale locale) async {
    final storage = await _storage;
    await storage.setString(_localeKey, locale.languageCode);
  }

  Future<Locale> getLocale() async {
    final storage = await _storage;
    final codeLocale = storage.getString(_localeKey);

    if (codeLocale == null) return defaultLocale;

    return Locale(codeLocale);
  }
}
