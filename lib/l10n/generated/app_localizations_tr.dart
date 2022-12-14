import 'app_localizations.dart';

/// The translations for Turkish (`tr`).
class AppLocalizationsTr extends AppLocalizations {
  AppLocalizationsTr([String locale = 'tr']) : super(locale);

  @override
  String get serverErrorMessage => 'Sunucu hatası oluştu';

  @override
  String get errorInternetConnection => 'İnternet Bağlantı Hatası';

  @override
  String get language => 'Dil';

  @override
  String get languageName => 'Türk';

  @override
  String get oops => 'Hata...';

  @override
  String get somethingWentWrong => 'Bir şeyler yanlış gitti. Daha sonra tekrar deneyin veya ekranı güncelleyin';

  @override
  String get ok => 'TAMAM';

  @override
  String get theme => 'Tema';

  @override
  String get light => 'Işık';

  @override
  String get dark => 'Karanlık';

  @override
  String get flutterDev => 'Flutter Dev';

  @override
  String get posts => 'Gönderiler';

  @override
  String get userList => 'Kullanıcı listesi';

  @override
  String get liquidSwipe => 'Sıvı Kaydırma';

  @override
  String get shatteringPage => 'Paramparça Sayfa';

  @override
  String get textAnimations => 'Metin Animasyonları';

  @override
  String get loading => 'Yükleniyor';

  @override
  String get yourPosts => 'Sizin gönderileriniz';

  @override
  String get edit => 'Düzenlemek';

  @override
  String get remove => 'Kaldırmak';

  @override
  String get welcomeBack => 'Tekrar hoşgeldiniz';

  @override
  String get shatter => 'Kırmak';

  @override
  String get textActivity => 'Metin Etkinliği';

  @override
  String get next => 'Sonraki';

  @override
  String get proArea => 'ProArea';

  @override
  String get settings => 'Ayarlar';

  @override
  String get aboutApp => 'Uygulama hakkında';

  @override
  String get aboutAppFullName => 'Uygulama ProArea Animations Showcase';

  @override
  String get aboutAppHead => 'ProArea uzman ekibinden tanıtım uygulaması';

  @override
  String get aboutAppDescription => 'Uygulamada en sık kullanılan görsel efektlerin bir listesini bulabilirsiniz.\n\nTasarım ekibi benzersiz, harika bir arayüz oluşturdu ve programcılarımız uygulamada tasarım çözümleri uyguladı.';

  @override
  String get signOut => 'Oturumu Kapat';

  @override
  String version(String value) {
    return 'Uygulama sürümü: $value ';
  }

  @override
  String get save => 'Kaydetmek';

  @override
  String get usernameSaved => 'Kullanıcı adı kaydedildi';

  @override
  String get username => 'Username';

  @override
  String v(String value) {
    return 'v${value}';
  }

  @override
  String get guest => 'Misafir';

  @override
  String get cancel => 'iptal';
}
