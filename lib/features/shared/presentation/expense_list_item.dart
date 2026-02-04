import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ExpenseListItem extends ConsumerWidget {
  final String title;
  final String subtitle;
  final String trailing;
  final bool isIncome;

  const ExpenseListItem({
    super.key,
    required this.title,
    required this.subtitle,
    required this.trailing,
    required this.isIncome,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final amountChar = isIncome ? '+' : '-';
    final Color amountColor = isIncome ? Colors.green : Colors.red;

    return ListTile(
      title: Text(title),
      subtitle: Text(subtitle),
      trailing: Text(
        "$amountChar$trailing",
        style: TextStyle(fontSize: 18, color: amountColor),
      ),
    );
  }
}
