import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/base/base_cubit.dart';
import '../../../bloc/users/users_cubit.dart';
import '../../views/snack_bar/show_snack_bar.dart';
import '../../views/waiters/app_loader.dart';

class UsersPage extends StatelessWidget {
  const UsersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UsersCubit, UsersState>(
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

  Widget _buildContent(UsersState state) {
    return Scaffold(
      appBar: AppBar(),
      body: Text(state.users.join()),
    );
  }
}
