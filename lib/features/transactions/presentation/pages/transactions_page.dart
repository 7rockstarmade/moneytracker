import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:moneytracker/features/shared/presentation/expense_list_item.dart';
import 'package:moneytracker/features/transactions/providers/transactions_provider.dart';

class TransactionsPage extends ConsumerWidget {
  const TransactionsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final repo = ref.watch(transactionsProvider);
    final dateTimeFormatter = DateFormat('dd.MM.yyyy HH:mm');
    return ValueListenableBuilder(
      valueListenable: repo.listenable(),

      builder: (context, value, child) {
        final transactions = repo.getAllSorted();
        return CustomScrollView(
          slivers: [
            SliverList(
              delegate: SliverChildBuilderDelegate((context, index) {
                final transaction = transactions[index];
                return ExpenseListItem(
                  title: transaction.title,
                  subtitle: dateTimeFormatter.format(transaction.createdAt),
                  trailing: transaction.amount.toString(),
                  isIncome: transaction.isIncome,
                );
              }, childCount: transactions.length),
            ),

            const SliverToBoxAdapter(child: SizedBox(height: 24)),
          ],
        );
      },
    );
  }
}
