import 'package:injectable/injectable.dart';

import '../../../base/service/base_service.dart';

@injectable
class TokenService extends BaseService {
  const TokenService();

  Future<String> getToken() async {
    return makeErrorParsedCall(() async => '');
  }
}
