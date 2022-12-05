import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../base/bloc/base_cubit.dart';
import '../../../l10n/localization_helper.dart';
import '../dialogs/show_app_alert_dialog.dart';
import '../snack_bar/show_snack_bar.dart';

void defaultAppListener<S extends BaseState>(BuildContext context, S state) {
  return appListener(context, state);
}

void errorAppListener<S extends BaseState>(BuildContext context, S state) {
  _showErrorDialog(context);
}

void appListener<S extends BaseState>(
  BuildContext context,
  S state, {
  void Function(BuildContext context, S state)? listenInfo,
  void Function(BuildContext context, S state)? listenError,
  void Function(BuildContext context, S state)? listenDefault,
}) {
  switch (state.status) {
    case StateStatus.info:
      _onInfo(context, state, listenInfo);
      break;
    case StateStatus.error:
      _onError(context, state, listenError);
      break;
    default:
      listenDefault?.call(context, state);
      break;
  }
}

void _onInfo<S extends BaseState>(
  BuildContext context,
  S state,
  void Function(BuildContext context, S state)? callBack,
) {
  if (callBack != null) return callBack(context, state);

  AppSnackBar.of(context).showSuccess(state.message);
}

void _onError<S extends BaseState>(
  BuildContext context,
  S state,
  void Function(BuildContext context, S state)? callBack,
) {
  if (callBack != null) return callBack(context, state);

  _showErrorDialog(context, state.message);
}

Future<bool?> _showErrorDialog(BuildContext context, [String? info]) async {
  return showAppAlertDialog<bool>(
    context,
    title: context.strings.oops,
    info: info ?? context.strings.somethingWentWrong,
    cancelText: context.strings.ok,
    onCancel: context.router.pop,
  );
}
