import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../themes/theme_app.dart';
import '../../../base/service/base_service.dart';

@injectable
class ThemeService extends BaseService {
  static const _themeKey = 'theme';
  Future<SharedPreferences> get _storage => SharedPreferences.getInstance();

  Future<ThemeType?> getTheme() async {
    final storage = await _storage;
    final result = storage.getString(_themeKey);
    if (result == null) return null;
    return ThemeType.fromString(result);
  }

  Future<bool> saveTheme(ThemeType type) async {
    final storage = await _storage;
    return storage.setString(_themeKey, type.name);
  }
}
