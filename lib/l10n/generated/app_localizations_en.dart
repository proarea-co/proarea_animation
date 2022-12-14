import 'app_localizations.dart';

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get serverErrorMessage => 'Server error occurred';

  @override
  String get errorInternetConnection => 'Internet Connection Error';

  @override
  String get language => 'Language';

  @override
  String get languageName => 'English';

  @override
  String get oops => 'Ooops...';

  @override
  String get somethingWentWrong => 'Something went wrong. Try again later or update the screen';

  @override
  String get ok => 'OK';

  @override
  String get theme => 'Theme';

  @override
  String get light => 'Light';

  @override
  String get dark => 'Dark';

  @override
  String get flutterDev => 'Flutter Dev';

  @override
  String get posts => 'Posts';

  @override
  String get userList => 'User List';

  @override
  String get liquidSwipe => 'Liquid Swipe';

  @override
  String get shatteringPage => 'Shattering Page';

  @override
  String get textAnimations => 'Text Animations';

  @override
  String get loading => 'Loading';

  @override
  String get yourPosts => 'Your posts';

  @override
  String get edit => 'Edit';

  @override
  String get remove => 'Remove';

  @override
  String get welcomeBack => 'Welcome back';

  @override
  String get shatter => 'Shatter';

  @override
  String get textActivity => 'Text Activity';

  @override
  String get next => 'Next';

  @override
  String get proArea => 'ProArea';

  @override
  String get settings => 'Settings';

  @override
  String get aboutApp => 'About the app';

  @override
  String get aboutAppFullName => 'About the ProArea Animations Showcase';

  @override
  String get aboutAppHead => 'Introductory application from the ProArea team of specialists';

  @override
  String get aboutAppDescription => 'In the app, you can find a list of the most commonly used visual effects.\n\nThe design team created a unique, great interface, and our programmers implemented design solutions in the application.';

  @override
  String get signOut => 'Sign Out';

  @override
  String version(String value) {
    return 'App version: $value';
  }

  @override
  String get save => 'Save';

  @override
  String get usernameSaved => 'Username saved';

  @override
  String get username => 'Username';

  @override
  String v(String value) {
    return 'v${value}';
  }

  @override
  String get guest => 'Guest';

  @override
  String get cancel => 'Cancel';
}
