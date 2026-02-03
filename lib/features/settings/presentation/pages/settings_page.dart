import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:moneytracker/features/settings/presentation/widgets/settings_item.dart';

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
                value: true,
                onChanged: (bool value) {},
              ),
            );
          case 1:
            return const SettingsItem(
              title: 'Currency',
              iconPath: 'assets/icons/exchange.png',
            );
          case 2:
            return const SettingsItem(
              title: 'Reset data',
              iconPath: 'assets/icons/reset.png',
            );
          case 3:
            return const SettingsItem(
              title: 'About us',
              iconPath: 'assets/icons/info.png',
            );
          default:
            return const SizedBox();
        }
      },
    );
  }
}
