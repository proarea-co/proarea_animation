import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../base/bloc/base_cubit.dart';
import 'app_builder.dart';
import 'app_listener.dart';

@immutable
class AppConsumer<C extends BaseCubit<S>, S extends BaseState>
    extends StatelessWidget {
  final bool withScaffold;
  final Widget Function(S state) builder;
  final Widget Function(S state)? buildLoading;
  final Widget Function(S state)? buildRefresh;
  final Widget Function(S state)? buildError;
  final Function(BuildContext context, S state)? listenInfo;
  final Function(BuildContext context, S state)? listenError;
  final Function(BuildContext context, S state)? listenDefault;
  final VoidCallback? onRetry;

  const AppConsumer({
    super.key,
    required this.builder,
    this.withScaffold = true,
    this.buildLoading,
    this.buildRefresh,
    this.buildError,
    this.listenInfo,
    this.listenError,
    this.listenDefault,
    this.onRetry,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<C, S>(
      listener: (context, state) {
        appListener(
          context,
          state,
          listenInfo: listenInfo,
          listenError: listenError,
          listenDefault: listenDefault,
        );
      },
      builder: (context, state) {
        return AppBuilder<C, S>(
          key: key,
          builder: builder,
          withScaffold: withScaffold,
          withErrorBuilder: false,
          buildLoading: buildLoading,
          buildRefresh: buildRefresh,
          buildError: buildError,
          onRetry: onRetry,
        );
      },
    );
  }
}
