part of 'posts_service.dart';

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
