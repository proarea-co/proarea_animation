import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../gen/assets.gen.dart';
import '../../../../l10n/localization_helper.dart';
import '../../../views/dialogs/app_cupertino_dialog.dart';
import 'settings_list_tile.dart';

class UsernameCard extends StatelessWidget {
  final String username;

  const UsernameCard({
    super.key,
    this.username = '',
  });

  @override
  Widget build(BuildContext context) {
    var username = this.username;
    if (username.isEmpty) username = context.strings.guest;
    return SettingsListTile(
      asset: Assets.svg.usernameIcon,
      title: context.strings.username,
      subtitle: username,
      onTap: () {
        showCupertinoDialog(
          context: context,
          builder: (dialogContext) {
            return AppCupertinoDialog(
              settingsCubit: context.read(),
              username: this.username,
            );
          },
        );
      },
    );
  }
}
