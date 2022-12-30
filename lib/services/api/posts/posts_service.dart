import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../../../api/retrofit/app_api.dart';
import '../../../base/service/base_service.dart';
import '../../../di/di.dart';
import '../../../mock/mock_posts.dart';
import '../../../models/post.dart';

part 'posts_service_dev.dart';
part 'posts_service_mock.dart';

@immutable
abstract class PostsService extends BaseService {
  const PostsService();

  Future<List<Post>> getPosts();
}
