import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../../../api/retrofit/app_api.dart';
import '../../../base/service/base_service.dart';
import '../../../di/di.dart';
import '../../../mock/mock_posts.dart';
import '../../../models/post.dart';

@immutable
abstract class PostsService extends BaseService {
  const PostsService();

  Future<List<Post>> getPosts();
}

@Injectable(as: PostsService, env: [Environment.dev])
@immutable
class PostsServiceDev extends PostsService {
  final AppApi _appApi;
  const PostsServiceDev(this._appApi);

  @override
  Future<List<Post>> getPosts() async {
    return makeErrorParsedCall(() async => _appApi.getPosts());
  }
}

@Injectable(as: PostsService, env: [EnvironmentExtension.mock])
@immutable
class PostsServiceMock extends PostsService {
  @override
  Future<List<Post>> getPosts() async {
    return makeErrorParsedCall(() async {
      return mockPosts.map((json) => Post.fromJson(json)).toList();
    });
  }
}
