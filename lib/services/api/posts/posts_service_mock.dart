part of 'posts_service.dart';

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
