import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:moneytracker/features/settings/presentation/widgets/about_us_sheet.dart';
import 'package:moneytracker/features/settings/presentation/widgets/settings_item.dart';
import 'package:moneytracker/features/shared/presentation/show_sheet.dart';

class SettingsPage extends ConsumerWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListView.separated(
      padding: const EdgeInsetsGeometry.directional(
        start: 15,
        end: 15,
        bottom: 15,
      ),
      itemCount: 4,
      separatorBuilder: (_, _) => const Divider(),
      itemBuilder: (context, index) {
        switch (index) {
          case 0:
            return SettingsItem(
              title: 'Dark theme',
              iconPath: 'assets/icons/moon.png',
              trailing: CupertinoSwitch(
                value: false,
                onChanged: (bool value) {},
              ),
            );
          case 1:
            return SettingsItem(
              title: 'Currency',
              iconPath: 'assets/icons/exchange.png',
            );
          case 2:
            return SettingsItem(
              title: 'Reset data',
              iconPath: 'assets/icons/reset.png',
            );
          case 3:
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
