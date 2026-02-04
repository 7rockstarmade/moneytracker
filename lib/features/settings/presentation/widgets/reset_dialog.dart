import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:moneytracker/core/theme/app_colors.dart';
import 'package:moneytracker/core/theme/theme_provider.dart';
import 'package:moneytracker/features/transactions/providers/transactions_provider.dart';

Future<void> showResetDialog(BuildContext context, WidgetRef ref) async {
  final isDarkMode = ref.read(themeProvider);
  final textColor = isDarkMode ? Colors.white : AppColors.neutral2;
  final ok = await showDialog<bool>(
    context: context,
    useRootNavigator: true,
    builder: (dialogContext) => AlertDialog(
      title: const Text('Reset data?'),
      content: const Text(
        'All transactions will be deleted. This cannot be undone.',
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(dialogContext).pop(false),
          child: Text('Cancel', style: TextStyle(color: textColor)),
        ),
        TextButton(
          onPressed: () => Navigator.of(dialogContext).pop(true),
          child: Text('Reset', style: TextStyle(color: textColor)),
        ),
      ],
    ),
  );

  if (ok != true) return;

  await ref.read(transactionsProvider).clearAll();
  if (context.mounted) {
    showDialog(
      context: context,
      useRootNavigator: true,
      builder: (dialogContext) => AlertDialog(
        title: Text('Done', style: TextStyle(color: textColor)),
        content: Text(
          'Data has been reset successfully.',
          style: TextStyle(color: textColor),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(dialogContext).pop(),
            child: Text('OK', style: TextStyle(color: textColor)),
          ),
        ],
      ),
    );
  }
}
