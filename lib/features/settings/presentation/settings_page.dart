import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:moneytracker/core/theme/app_text_styles.dart';

class SettingsPage extends ConsumerWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: EdgeInsetsGeometry.all(16),
      child: Column(
        spacing: 10,
        children: [
          Row(
            mainAxisAlignment: .spaceBetween,
            children: [
              Row(
                spacing: 10,
                children: [
                  Image.asset("assets/icons/moon.png", width: 25),
                  Text("Dark theme", style: AppTextStyles.settingsTextStyle),
                ],
              ),
            ],
          ),
          Divider(),
          Row(
            mainAxisAlignment: .spaceBetween,
            children: [
              Row(
                spacing: 10,
                children: [
                  Image.asset("assets/icons/exchange.png", width: 25),
                  Text("Currency", style: AppTextStyles.settingsTextStyle),
                ],
              ),
            ],
          ),
          Divider(),
          Row(
            mainAxisAlignment: .spaceBetween,
            children: [
              Row(
                spacing: 10,
                children: [
                  Image.asset("assets/icons/reset.png", width: 25),
                  Text("Reset data", style: AppTextStyles.settingsTextStyle),
                ],
              ),
            ],
          ),
          Divider(),
          Row(
            mainAxisAlignment: .spaceBetween,
            children: [
              Row(
                spacing: 10,
                children: [
                  Image.asset("assets/icons/info.png", width: 25),
                  Text("About us", style: AppTextStyles.settingsTextStyle),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
