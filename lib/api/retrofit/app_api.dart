import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

import '../../models/post.dart';
import '../../models/user.dart';

part 'app_api.g.dart';

@RestApi()
abstract class AppApi {
  factory AppApi(Dio dio, {String baseUrl}) = _AppApi;

  @GET('/posts')
  Future<List<Post>> getPosts();

  @GET('/users')
  Future<List<User>> getUsers();
}

@module
abstract class AppApiModule {
  @lazySingleton
  AppApi createAppApi(Dio dio) => AppApi(dio);
}
