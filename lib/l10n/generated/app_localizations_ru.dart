import 'app_localizations.dart';

/// The translations for Russian (`ru`).
class AppLocalizationsRu extends AppLocalizations {
  AppLocalizationsRu([String locale = 'ru']) : super(locale);

  @override
  String get flag => '🏳️';

  @override
  String get serverErrorMessage => 'Ошибка сервера';

  @override
  String get errorInternetConnection => 'Ошибка соединения';

  @override
  String get language => 'Язык';

  @override
  String get languageName => 'Русский';

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
  String get aboutApp => 'О приложении';

  @override
  String get aboutAppFullName => 'О приложении ProArea Animations Showcase';

  @override
  String get aboutAppHead => 'Ознакомительное приложение от команды специалистов ProArea';

  @override
  String get aboutAppDescription => 'В приложении вы можете найти список наиболее часто используемых визуальных эффектов.\n\nКоманда дизайнеров создала неповторимый, великолепный интерфейс, а наши программисты в приложении реализовали дизайн-решения';

  @override
  String get signOut => 'Выйти';

  @override
  String version(String value) {
    return 'Версия приложения: $value ';
  }

  @override
  String get save => 'Сохранить';

  @override
  String get usernameSaved => 'Имя пользователя сохранено';

  @override
  String get username => 'Имя пользователя';

  @override
  String v(String value) {
    return 'v${value}';
  }

  @override
  String get guest => 'Гость';

  @override
  String get cancel => 'Отмена';
}
