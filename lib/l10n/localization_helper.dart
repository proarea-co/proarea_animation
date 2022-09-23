import 'dart:ui';

import 'package:flutter/widgets.dart';

import 'generated/app_localizations.dart';
import 'generated/app_localizations_en.dart';

export 'generated/app_localizations.dart';

Locale helpLocale = window.locale;
const defaultLocale = Locale('en');
final defaultLocalize = AppLocalizationsEn(defaultLocale.languageCode);

final _localizations = {
  const Locale('en'): getLocaleLocalizations().enLanguage,
  const Locale('ru'): getLocaleLocalizations().ruLanguage,
};

AppLocalizations getLocalizations(BuildContext context) {
  final localizations = AppLocalizations.of(context);
  if (localizations != null) return localizations;
  return defaultLocalize;
}

AppLocalizations getLocaleLocalizations([Locale? locale]) {
  Locale? local;
  if (locale == null) {
    local = helpLocale;
  } else {
    local = locale;
  }

  final localeSupported = AppLocalizations.supportedLocales.contains(local);

  if (!localeSupported) return defaultLocalize;

  return lookupAppLocalizations(local);
}

String getLocaleName(Locale locale) {
  final langName = _localizations[locale];
  return langName ?? getLocaleLocalizations().enLanguage;
}
