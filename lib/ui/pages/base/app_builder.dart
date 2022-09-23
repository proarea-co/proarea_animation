import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/base/base_cubit.dart';
import '../../views/waiters/app_loader.dart';

class AppBuilder<C extends BaseCubit<S>, S extends BaseState>
    extends StatelessWidget {
  final Widget Function(S state) builder;

  const AppBuilder({
    super.key,
    required this.builder,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<C, S>(
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
