import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../../models/post.dart';
import '../../services/api/posts/posts_service.dart';
import '../base/base_cubit.dart';

part 'posts_state.dart';

@injectable
class PostsCubit extends BaseCubit<PostsState> {
  final PostsService _postsService;

  PostsCubit(
    this._postsService,
  ) : super(const PostsState());

  Future<void> getPosts() async {
    emit(state.copyWith(status: StateStatus.loading));
    await performSafeAction(() async {
      emit(state.copyWith(
        status: StateStatus.loaded,
        posts: await _postsService.getPosts(),
      ));
    });
  }

  @override
  void handleError(String massage) {
    emit(state.copyWith(
      status: StateStatus.error,
      massage: massage,
    ));
  }
}
