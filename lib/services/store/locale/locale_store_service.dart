import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../base_store_service.dart';

@preResolve
@injectable
class LocaleStoreService extends BaseStoreService<String> {
  @override
  String get storeKey => 'localeKey';

  const LocaleStoreService({
    required super.storage,
  });

  @factoryMethod
  static Future<LocaleStoreService> getInstance() async {
    return LocaleStoreService(storage: await SharedPreferences.getInstance());
  }
  
  @override
  Future<String?> get() async{
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
  Future<void> save(object){
    return makeErrorParsedCall(() async {
      await storage.setString(storeKey, object);
    });
  }
}
