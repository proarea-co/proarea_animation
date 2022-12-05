import 'app_localizations.dart';

/// The translations for Russian (`ru`).
class AppLocalizationsRu extends AppLocalizations {
  AppLocalizationsRu([String locale = 'ru']) : super(locale);

  @override
  String get weatherRandomPoint => 'Погода в случайной точке';

  @override
  String get weatherRandomCity => 'Погода в случайном городе';

  @override
  String get ruButton => 'Русский';

  @override
  String get enButton => 'Английский';

  @override
  String get serverErrorMessage => 'Ошибка сервера';

  @override
  String get errorInternetConnection => 'Ошибка соединения';

  @override
  String get enLanguage => 'English';

  @override
  String get ruLanguage => 'Русский';

  @override
  String get oops => 'Упс...';

  @override
  String get somethingWentWrong => 'Что-то пошло не так, попробуйте обновить экран';

  @override
  String get ok => 'Хорошо';

  @override
  String get theme => 'Тема';

  @override
  String get light => 'Светлая';

  @override
  String get dark => 'Темная';
}