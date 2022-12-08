import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:package_info_plus/package_info_plus.dart';

import '../../../base/service/base_service.dart';

@injectable
@immutable
class PackageInfoService extends BaseService {
  const PackageInfoService();

  Future<PackageInfo> getPackageInfo() async {
    return makeErrorParsedCall(PackageInfo.fromPlatform);
  }
}
