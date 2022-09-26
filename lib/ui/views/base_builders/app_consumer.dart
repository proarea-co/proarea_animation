import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/base/base_cubit.dart';
import '../snack_bar/show_snack_bar.dart';
import '../waiters/app_loader.dart';

class AppConsumer<C extends BaseCubit<S>, S extends BaseState>
    extends StatelessWidget {
  final Widget Function(S state) builder;
  final Widget Function(S state)? builderLoading;
  final Widget Function(S state)? builderRefresh;
  final Widget Function(BuildContext context, S state)? listenerInfo;
  final Widget Function(BuildContext context, S state)? listenerError;

  const AppConsumer({
    super.key,
    required this.builder,
    this.builderLoading,
    this.builderRefresh,
    this.listenerInfo,
    this.listenerError,
  });

  void _onInfo(BuildContext context, state) {
    listenerInfo?.call(context, state) ?? showSnackBar(context, state.massage);
  }

  void _onError(BuildContext context, state) {
    listenerError?.call(context, state) ??
        showSnackBar(context, state.massage, error: true);
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<C, S>(
      listener: (context, state) {
        switch (state.status) {
          case StateStatus.info:
            _onInfo(context, state);
            break;
          case StateStatus.error:
            _onError(context, state);
            break;
          default:
        }
      },
      builder: (context, state) {
        final loading = state.status == StateStatus.loading;
        final refresh = state.status == StateStatus.refresh;

        if (loading) return _buildLoading(state);

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

  Widget _buildRefresh(S state) {
    return builderRefresh?.call(state) ?? _buildLoader();
  }

  Widget _buildLoader() => const Center(child: AppLoader());
}
