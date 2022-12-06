import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/users/users_cubit.dart';
import '../../../di/di.dart';
import '../../../themes/theme_app.dart';
import '../../views/base_builders/app_consumer.dart';
import 'components/arrow_icons_view.dart';
import 'components/user_details_view.dart';

class UsersPage extends StatefulWidget with AutoRouteWrapper {
  const UsersPage({super.key});

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider<UsersCubit>(
      create: (_) => locator()..getUsers(),
      child: this,
    );
  }

  @override
  State<UsersPage> createState() => _UsersPageState();
}

class _UsersPageState extends State<UsersPage> {
  BoxDecoration get _boxDecoration => BoxDecoration(
        gradient: LinearGradient(
          colors: [
            context.colorScheme.primary,
            context.colorScheme.onPrimary,
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      );
  UsersCubit get _cubit => context.read();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AppConsumer<UsersCubit, UsersState>(
        withoutScaffold: true,
        builder: (state) {
          return DecoratedBox(
            decoration: _boxDecoration,
            child: SafeArea(
              child: Stack(
                children: <Widget>[
                  ArrowIconsView(
                    switchUser: _cubit.switchUser,
                  ),
                  _buildLine(),
                  _buildUserDetails(state),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildUserDetails(UsersState state) {
    final index = state.userIndex;
    if (state.users.length - 1 < index) return const SizedBox.shrink();
    return Positioned.fill(
      left: 30,
      top: 36,
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 250),
        child: UserDetailsView(
          key: UniqueKey(),
          user: state.users[index],
        ),
      ),
    );
  }

  Widget _buildLine() {
    return Positioned(
      left: 61,
      top: 0,
      bottom: 0,
      width: 2,
      child: Container(
        color: context.colorScheme.onBackground.withOpacity(0.8),
      ),
    );
  }
}
