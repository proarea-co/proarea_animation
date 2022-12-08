import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../base_store_service.dart';

@preResolve
@injectable
class UserStoreService extends BaseStoreService<String> {
  
  const UserStoreService({required super.storage});

  @factoryMethod
  static Future<UserStoreService> getInstance() async {
    return UserStoreService(storage: await SharedPreferences.getInstance());
  }

  @override
  String get storeKey => 'userKey';

  @override
  Future<String?> get() {
    return makeErrorParsedCall(() async {
      return storage.getString(storeKey);
    });
  }

  @override
  Future<void> remove() {
    return makeErrorParsedCall(() async {
      await storage.remove(storeKey);
    });
  }

  @override
  Future<void> save(object) {
    return makeErrorParsedCall(() async {
      await storage.setString(storeKey, object);
    });
  }
}
