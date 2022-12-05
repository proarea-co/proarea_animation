import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/posts/posts_cubit.dart';
import '../../../bloc/users/users_cubit.dart';
import '../../../di/di.dart';
import '../posts/posts_page.dart';
import '../users/users_page.dart';

class HomePage extends StatelessWidget with AutoRouteWrapper {
  const HomePage({super.key});

  @override
  Widget wrappedRoute(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<PostsCubit>(
          create: (_) => getIt()..getPosts(),
          child: this,
        ),
        BlocProvider<UsersCubit>(
          create: (_) => getIt()..getUsers(),
        ),
      ],
      child: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: const [
          Expanded(child: PostsPage()),
          Expanded(child: UsersPage()),
        ],
      ),
    );
  }
}
