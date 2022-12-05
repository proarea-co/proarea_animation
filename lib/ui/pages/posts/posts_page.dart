import 'package:flutter/material.dart';

import '../../../bloc/posts/posts_cubit.dart';
import '../../views/base_builders/app_consumer.dart';

class PostsPage extends StatelessWidget {
  const PostsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppConsumer<PostsCubit, PostsState>(
      builder: (state) {
        return Scaffold(
          appBar: AppBar(),
          body: Text(state.posts.join()),
        );
      },
    );
  }
}
