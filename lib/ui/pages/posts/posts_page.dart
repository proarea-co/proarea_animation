import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/base/base_cubit.dart';
import '../../../bloc/posts/posts_cubit.dart';
import '../../views/snack_bar/show_snack_bar.dart';
import '../../views/waiters/app_loader.dart';

class PostsPage extends StatelessWidget {
  const PostsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PostsCubit, PostsState>(
      listener: (context, state) {
        final isError = state.status == StateStatus.error;
        final isInfo = state.status == StateStatus.info;

        if (isError) showSnackBar(context, state.massage, error: true);

        if (isInfo) showSnackBar(context, state.massage);
      },
      builder: (context, state) {
        final loading = state.status == StateStatus.loading;
        final refresh = state.status == StateStatus.refresh;

        if (loading) return const Center(child: AppLoader());

        return Stack(
          children: [
            _buildContent(state),
            if (refresh) const Center(child: AppLoader()),
          ],
        );
      },
    );
  }

  Widget _buildContent(PostsState state) {
    return Scaffold(
      appBar: AppBar(),
      body: Text(state.posts.join()),
    );
  }
}
