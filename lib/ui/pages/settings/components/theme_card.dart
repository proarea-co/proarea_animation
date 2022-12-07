import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../bloc/app_controller/app_controller_cubit.dart';
import '../../../../l10n/localization_helper.dart';
import '../../../../themes/theme_app.dart';
import '../../../views/base_builders/app_builder.dart';
import '../../../views/bottom_sheet/app_bottom_sheet.dart';

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
        return GestureDetector(
          onTap: () async {
            final themeType = await _showThemeDialog(context, currentTheme);

            if (themeType == null) return;

            await context.read<AppControllerCubit>().changeTheme(themeType);
          },
          child: ListTile(
            leading: const Icon(Icons.style_outlined),
            title: Text(context.strings.theme),
            subtitle: Text(currentTheme.getLocalizedName(context)),
          ),
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
