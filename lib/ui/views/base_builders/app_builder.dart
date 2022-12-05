import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/base/base_cubit.dart';
import '../errors/error_view.dart';
import '../waiters/app_loader.dart';

class AppBuilder<C extends BaseCubit<S>, S extends BaseState>
    extends StatelessWidget {
  final Widget Function(S state) builder;
  final Widget Function(S state)? builderLoading;
  final Widget Function(S state)? builderRefresh;
  final Widget Function(S state)? builderError;

  const AppBuilder({
    super.key,
    required this.builder,
    this.builderLoading,
    this.builderRefresh,
    this.builderError,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<C, S>(
      builder: (context, state) {
        final loading = state.status == StateStatus.loading;
        final refresh = state.status == StateStatus.refresh;
        final error = state.status == StateStatus.error;

        if (loading) return _buildLoading(state);

        if (error) return _buildError(state);

        return Stack(
          children: [
            builder(state),
            if (refresh) _buildRefresh(state),
          ],
        );
      },
    );
  }

  Widget _buildLoading(S state) {
    return builderLoading?.call(state) ?? _buildLoader();
  }

  Widget _buildError(S state) {
    return builderError?.call(state) ?? ErrorView(massage: state.massage);
  }

  Widget _buildRefresh(S state) {
    return builderRefresh?.call(state) ?? _buildLoader();
  }

  Widget _buildLoader() => const Center(child: AppLoader());
}
