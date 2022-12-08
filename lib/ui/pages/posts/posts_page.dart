import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/posts/posts_cubit.dart';
import '../../../di/di.dart';
import '../../../l10n/localization_helper.dart';
import '../../../models/post.dart';
import '../../../themes/theme_app.dart';
import '../../views/base_builders/app_consumer.dart';
import 'components/post_item_view.dart';

class PostsPage extends StatefulWidget with AutoRouteWrapper {
  const PostsPage({super.key});

  @override
  State<PostsPage> createState() => _PostsPageState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider<PostsCubit>(
      create: (_) => locator()..getPosts(),
      child: this,
    );
  }
}

class _PostsPageState extends State<PostsPage> {
  late final _animatedListKey = GlobalKey<AnimatedListState>();

  PostsCubit get _cubit => context.read();

  void _onRemoveTap(int index, Post post) {
    _animatedListKey.currentState?.removeItem(
      index,
      (context, animation) {
        return FadeTransition(
          opacity: CurvedAnimation(
            parent: animation,
            curve: Curves.fastOutSlowIn,
          ),
          child: SizeTransition(
            sizeFactor: CurvedAnimation(
              parent: animation,
              curve: Curves.fastOutSlowIn,
            ),
            axisAlignment: 0.0,
            child: PostItemView(
              index: index,
              post: post,
              animationControllerValue: 0,
              onRemoveTap: () {},
            ),
          ),
        );
      },
    );
    _cubit.removePost(post);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AppConsumer<PostsCubit, PostsState>(
        withoutScaffold: true,
        builder: (state) {
          return SafeArea(
            child: Column(
              children: [
                _buildHeader(state),
                Expanded(child: _buildList(state)),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildHeader(PostsState state) {
    return Container(
      decoration: BoxDecoration(
        color: context.colorScheme.surface,
        boxShadow: [
          BoxShadow(
            blurRadius: 2,
            color: context.colorScheme.tertiaryContainer,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Stack(
        children: [
          _buildIcon(),
          _buildTitle(),
        ],
      ),
    );
  }

  Widget _buildTitle() {
    return SizedBox(
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            context.strings.yourPosts,
            style: const TextStyle(fontSize: 18),
          ),
        ],
      ),
    );
  }

  Widget _buildIcon() {
    return InkWell(
      onTap: context.router.pop,
      child: const Padding(
        padding: EdgeInsets.only(left: 16),
        child: SizedBox(
          height: 50,
          child: Icon(Icons.menu, size: 30),
        ),
      ),
    );
  }

  Widget _buildList(PostsState state) {
    final posts = state.posts;
    return AnimatedList(
      key: _animatedListKey,
      padding: const EdgeInsets.only(top: 4),
      initialItemCount: posts.length,
      itemBuilder: (context, int index, animation) {
        return FadeTransition(
          opacity: CurvedAnimation(
            parent: animation,
            curve: const Interval(0.5, 1.0),
          ),
          child: SizeTransition(
            sizeFactor: CurvedAnimation(
              parent: animation,
              curve: Curves.easeInOut,
            ),
            axisAlignment: 0.0,
            child: PostItemView(
              key: UniqueKey(),
              post: posts[index],
              index: index,
              onRemoveTap: () {
                _onRemoveTap(
                  index,
                  posts[index],
                );
              },
            ),
          ),
        );
      },
    );
  }
}
