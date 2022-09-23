import 'app_localizations.dart';

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get weatherRandomPoint => 'Weather Random Point';

  @override
  String get weatherRandomCity => 'Weather Random City';

  @override
  String get ruButton => 'Ru';

  @override
  String get enButton => 'En';

  @override
  String get serverErrorMessage => 'Server error occurred';

  @override
  String get errorInternetConnection => 'Internet Connection Error';

  @override
  String get enLanguage => 'English';

  @override
  String get ruLanguage => 'Русский';

  @override
  String get theme => 'Theme';

  @override
  String get light => 'Light';

  @override
  String get dark => 'Dark';
}
