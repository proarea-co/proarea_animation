import 'app_localizations.dart';

/// The translations for Ukrainian (`uk`).
class AppLocalizationsUk extends AppLocalizations {
  AppLocalizationsUk([String locale = 'uk']) : super(locale);

  @override
  String get flag => '🇺🇦';

  @override
  String get serverErrorMessage => 'Помилка сервера';

  @override
  String get errorInternetConnection => 'Помилка з\'єднання';

  @override
  String get language => 'Мова';

  @override
  String get languageName => 'Українська';

  @override
  String get oops => 'Упс...';

  @override
  String get somethingWentWrong => 'Щось пішло не так, спробуйте оновити екран';

  @override
  String get ok => 'Так';

  @override
  String get theme => 'Тема';

  @override
  String get light => 'Світла';

  @override
  String get dark => 'Темна';

  @override
  String get flutterDev => 'Flutter Dev';

  @override
  String get posts => 'Пости';

  @override
  String get userList => 'Перелік користувачів';

  @override
  String get liquidSwipe => 'Свайп liquid-эффект';

  @override
  String get shatteringPage => 'Сторінка краш-ефект';

  @override
  String get textAnimations => 'Текстові анімації';

  @override
  String get loading => 'Завантаження';

  @override
  String get yourPosts => 'Ваші пости';

  @override
  String get edit => 'Змінити';

  @override
  String get remove => 'Видалити';

  @override
  String get welcomeBack => 'З поверненням';

  @override
  String get shatter => 'Розбити';

  @override
  String get textActivity => 'Текстова активність';

  @override
  String get next => 'Далі';

  @override
  String get proArea => 'ProArea';

  @override
  String get settings => 'Налаштування';

  @override
  String get aboutApp => 'Про додаток';

  @override
  String get aboutAppFullName => 'Про додаток ProArea Animations Showcase';

  @override
  String get aboutAppHead => 'Ознайомчий додаток від команди спеціалістів ProArea';

  @override
  String get aboutAppDescription => 'У додатку ви можете знайти список найпоширеніших візуальних ефектів.\n\nКоманда дизайнерів створила неповторний, чудовий інтерфейс, а наші програмісти у додатку реалізували дизайн-рішення';

  @override
  String get signOut => 'Вийти';

  @override
  String version(String value) {
    return 'Версія додатку: $value ';
  }

  @override
  String get save => 'Зберегти';

  @override
  String get usernameSaved => 'Ім\'я користувача збережене';

  @override
  String get username => 'Ім\'я користувача';

  @override
  String v(String value) {
    return 'v${value}';
  }

  @override
  String get guest => 'Гість';

  @override
  String get cancel => 'Скасувати';
}
