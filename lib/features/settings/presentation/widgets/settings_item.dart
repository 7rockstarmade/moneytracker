import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:moneytracker/core/theme/app_colors.dart';
import 'package:moneytracker/core/theme/app_text_styles.dart';

class SettingsItem extends ConsumerWidget {
  final String iconPath;
  final String title;
  final Widget? trailing;
  final VoidCallback? onTap;

  const SettingsItem({
    super.key,
    required this.iconPath,
    required this.title,
    this.trailing,
    this.onTap,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  width: 44,
                  height: 44,

                  decoration: BoxDecoration(
                    color: AppColors.neutral3,
                    borderRadius: .circular(12),
                  ),
                  child: Center(child: Image.asset(iconPath, width: 24)),
                ),
                const SizedBox(width: 12),
                Text(title, style: AppTextStyles.settingsTextStyle),
              ],
            ),
            ?trailing,
          ],
        ),
      ),
    );
  }
}
