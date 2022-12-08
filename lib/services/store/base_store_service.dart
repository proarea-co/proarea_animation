import 'package:shared_preferences/shared_preferences.dart';

import '../../base/service/base_service.dart';

abstract class BaseStoreService<T> extends BaseService {
  abstract final String storeKey;
  final SharedPreferences storage;

  const BaseStoreService({
    required this.storage,
  });

  Future<void> save(T object);
  Future<T?> get();
  Future<void> remove();
}
