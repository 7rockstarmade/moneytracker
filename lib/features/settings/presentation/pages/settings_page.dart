import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:moneytracker/core/theme/theme_provider.dart';
import 'package:moneytracker/features/settings/presentation/widgets/about_us_sheet.dart';
import 'package:moneytracker/features/settings/presentation/widgets/reset_dialog.dart';
import 'package:moneytracker/features/settings/presentation/widgets/settings_item.dart';
import 'package:moneytracker/features/shared/presentation/show_sheet.dart';

class SettingsPage extends ConsumerWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeState = ref.read(themeProvider.notifier);
    final isDarkTheme = ref.watch(themeProvider);

    return ListView.separated(
      padding: const EdgeInsetsGeometry.directional(
        start: 15,
        end: 15,
        bottom: 15,
      ),
      itemCount: 3,
      separatorBuilder: (_, _) => const Divider(),
      itemBuilder: (context, index) {
        switch (index) {
          case 0:
            return SettingsItem(
              title: 'Dark theme',
              iconPath: 'assets/icons/moon.png',
              trailing: CupertinoSwitch(
                value: isDarkTheme,
                onChanged: (value) {
                  themeState.state = value;
                },
              ),
            );
          case 1:
            return SettingsItem(
              title: 'Reset data',
              iconPath: 'assets/icons/reset.png',
              onTap: () {
                showResetDialog(context, ref);
              },
            );
          case 2:
            return SettingsItem(
              title: 'About us',
              iconPath: 'assets/icons/info.png',
              onTap: () {
                showSheet(context, AboutUsSheet());
              },
            );
          default:
            return const SizedBox();
        }
      },
    );
  }
}
