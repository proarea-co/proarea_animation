import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/base/base_cubit.dart';
import '../../views/snack_bar/show_snack_bar.dart';
import '../../views/waiters/app_loader.dart';

class AppConsumer<C extends BaseCubit<S>, S extends BaseState>
    extends StatelessWidget {
  final Widget Function(S state) builder;

  const AppConsumer({
    super.key,
    required this.builder,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<C, S>(
      listener: (context, state) {
        switch (state.status) {
          case StateStatus.error:
            showSnackBar(context, state.massage, error: true);
            break;
          case StateStatus.info:
            showSnackBar(context, state.massage);
            break;
          default:
        }
      },
      builder: (context, state) {
        final loading = state.status == StateStatus.loading;
        final refresh = state.status == StateStatus.refresh;

        if (loading) return const Center(child: AppLoader());

        return Stack(
          children: [
            builder(state),
            if (refresh) const Center(child: AppLoader()),
          ],
        );
      },
    );
  }
}
