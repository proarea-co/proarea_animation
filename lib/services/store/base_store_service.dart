import 'package:shared_preferences/shared_preferences.dart';

import '../../base/service/base_service.dart';

abstract class BaseStoreService<T> extends BaseService {
  final storeKey = 'key';
  final SharedPreferences storage;

  const BaseStoreService({
    required this.storage,
  });

  Future<void> save(T object);
  Future<T?> get();
  Future<void> remove();
}
