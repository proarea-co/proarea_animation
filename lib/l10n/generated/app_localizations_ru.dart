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
  String get language => 'Язык';

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

  @override
  String get flutterDev => 'Flutter Dev';

  @override
  String get posts => 'Посты';

  @override
  String get userList => 'Список пользователей';

  @override
  String get liquidSwipe => 'Свайп liquid-эффект';

  @override
  String get shatteringPage => 'Страница краш-эффект';

  @override
  String get textAnimations => 'Текстовые анимации';

  @override
  String get loading => 'Загрузка';

  @override
  String get yourPosts => 'Ваши посты';

  @override
  String get edit => 'Изменить';

  @override
  String get remove => 'Удалить';

  @override
  String get welcomeBack => 'С возвращением';

  @override
  String get shatter => 'Разбить';

  @override
  String get textActivity => 'Текстовая активность';

  @override
  String get next => 'Следующий';

  @override
  String get proArea => 'ProArea';

  @override
  String get settings => 'Настройки';

  @override
  String version(String value) {
    return 'Версия приложения: $value ';
  }

  @override
  String get signOut => 'Выйти';
}
