import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:moneytracker/features/shared/presentation/modal_sheet_line.dart';
import 'package:moneytracker/core/theme/app_colors.dart';
import 'package:moneytracker/core/theme/theme_provider.dart';

class AboutUsSheet extends ConsumerWidget {
  const AboutUsSheet({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDarkTheme = ref.watch(themeProvider);
    final colorText = isDarkTheme ? Colors.white : AppColors.neutral2;
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: .stretch,
        children: [
          Center(child: ModalSheetLine()),
          Text(
            "About us",
            textAlign: .center,
            style: TextStyle(color: colorText, fontWeight: .w600, fontSize: 30),
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: Text(
              "I don`t know what to write here, i`m done... made by 7rockstarmade",
              textAlign: .center,
              style: TextStyle(color: colorText, fontSize: 16),
            ),
          ),
          Padding(
            padding: EdgeInsetsGeometry.directional(
              start: 15,
              end: 15,
              bottom: 5,
            ),
            child: ClipRRect(
              borderRadius: .circular(15),
              child: Image.asset('assets/images/us.jpg'),
            ),
          ),
          Padding(
            padding: const EdgeInsetsGeometry.directional(bottom: 20, top: 10),
            child: Text(
              "me with my friends btw",
              textAlign: .center,
              style: TextStyle(
                color: isDarkTheme ? Colors.white60 : AppColors.neutral1,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
