import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:moneytracker/core/theme/theme_provider.dart';

class ModalSheetLine extends ConsumerWidget {
  const ModalSheetLine({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDarkTheme = ref.watch(themeProvider);
    return Container(
      width: 40,
      height: 4,
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: isDarkTheme
            ? const Color.fromARGB(129, 255, 255, 255)
            : Colors.black26,
        borderRadius: BorderRadius.circular(2),
      ),
    );
  }
}
