import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../base/bloc/base_cubit.dart';
import '../../../themes/theme_app.dart';
import '../errors/error_view.dart';
import '../loaders/app_loader.dart';

@immutable
class AppBuilder<C extends BaseCubit<S>, S extends BaseState>
    extends StatelessWidget {
  final bool withoutScaffold;
  final bool withErrorBuilder;
  final Widget Function(S state) builder;
  final Widget Function(S state)? buildLoading;
  final Widget Function(S state)? buildRefresh;
  final Widget Function(S state)? buildError;
  final VoidCallback? onRetry;

  const AppBuilder({
    super.key,
    required this.builder,
    this.withoutScaffold = false,
    this.withErrorBuilder = true,
    this.buildLoading,
    this.buildRefresh,
    this.buildError,
    this.onRetry,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<C, S>(
      builder: (context, state) {
        if (withoutScaffold) return _buildContent(state);

        return Scaffold(
          backgroundColor: context.colorScheme.background,
          body: _buildContent(state),
        );
      },
    );
  }

  Widget _buildContent(S state) {
    final loading = state.status == StateStatus.loading;
    final refresh = state.status == StateStatus.refresh;
    final error = state.status == StateStatus.error;

    if (loading) return _buildLoading(state);

    if (error && withErrorBuilder) return _buildError(state);

    return Stack(
      children: [
        builder(state),
        if (refresh) _buildRefresh(state),
      ],
    );
  }

  Widget _buildLoading(S state) {
    return buildLoading?.call(state) ?? _buildLoader();
  }

  Widget _buildError(S state) {
    return buildError?.call(state) ?? ErrorView(message: state.message);
  }

  Widget _buildRefresh(S state) {
    return buildRefresh?.call(state) ?? _buildLoader();
  }

  Widget _buildLoader() => const Center(child: AppLoader());
}
