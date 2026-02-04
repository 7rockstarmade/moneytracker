import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:moneytracker/core/theme/app_colors.dart';
import 'package:moneytracker/core/theme/theme_provider.dart';

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
    final isDarkTheme = ref.watch(themeProvider);
    final TextStyle settingsTextStyle = TextStyle(
      fontSize: 16,
      fontWeight: .w600,
      color: isDarkTheme ? Colors.white : AppColors.neutral2,
    );
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
                    color: isDarkTheme
                        ? Color.fromARGB(255, 202, 202, 202)
                        : AppColors.neutral3,
                    borderRadius: .circular(12),
                  ),
                  child: Center(child: Image.asset(iconPath, width: 24)),
                ),
                const SizedBox(width: 12),
                Text(title, style: settingsTextStyle),
              ],
            ),
            ?trailing,
          ],
        ),
      ),
    );
  }
}
