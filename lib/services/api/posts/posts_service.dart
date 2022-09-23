import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../../../api/retrofit/app_api.dart';
import '../../../models/post.dart';
import '../../base/base_service.dart';

@injectable
@immutable
class PostsService extends BaseService {
  final AppApi _appApi;
  const PostsService(this._appApi);

  Future<List<Post>> getPosts() async {
    return makeErrorParsedCall(() async => _appApi.getPosts());
  }
}
