import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../bloc/app_controller/app_controller_cubit.dart';
import '../../../../gen/assets.gen.dart';
import '../../../../l10n/localization_helper.dart';
import '../../../../themes/theme_app.dart';
import '../../../views/base_builders/app_builder.dart';
import '../../../views/bottom_sheet/app_bottom_sheet.dart';
import 'settings_list_tile.dart';

class ThemeCard extends StatelessWidget {
  const ThemeCard({super.key});

  Future<ThemeType?> _showThemeDialog(
    BuildContext context,
    ThemeType? themeType,
  ) async {
    final action = AppBottomSheet<ThemeType?>.of(context);
    final selectedTheme = await action.showBottomSheet(
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: ThemeType.values.map((theme) {
          return _buildThemeTile(
            context: context,
            themeType: theme,
            current: themeType == theme,
          );
        }).toList(),
      ),
    );
    if (themeType == selectedTheme) return null;

    return selectedTheme;
  }

  @override
  Widget build(BuildContext context) {
    return AppBuilder<AppControllerCubit, AppControllerState>(
      withoutScaffold: true,
      withErrorBuilder: false,
      builder: (controlState) {
        final currentTheme = controlState.themeType;
        return SettingsListTile(
          asset: Assets.svg.themeIcon,
          title: context.strings.theme,
          subtitle: currentTheme.getLocalizedName(context),
          onTap: () async {
            final cubit = context.read<AppControllerCubit>();
            final themeType = await _showThemeDialog(context, currentTheme);

            if (themeType == null) return;

            await cubit.changeTheme(themeType);
          },
        );
      },
    );
  }

  Widget _buildThemeTile({
    required BuildContext context,
    required ThemeType themeType,
    bool current = false,
  }) {
    final theme = context.colorScheme;
    final textColor = current ? theme.primary : theme.onSecondary;
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pop(themeType);
      },
      child: ListTile(
        textColor: textColor,
        title: Text(themeType.getLocalizedName(context)),
      ),
    );
  }
}
