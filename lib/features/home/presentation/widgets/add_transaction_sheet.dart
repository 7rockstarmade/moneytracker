import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:moneytracker/features/transactions/providers/transactions_provider.dart';
import 'package:moneytracker/features/home/presentation/widgets/add_transaction_form_sheet.dart';
import 'package:moneytracker/features/shared/models/transaction_model.dart';
import 'package:moneytracker/features/shared/presentation/modal_sheet_line.dart';
import 'package:moneytracker/features/shared/presentation/show_sheet.dart';

class AddTransactionSheet extends ConsumerWidget {
  const AddTransactionSheet({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ModalSheetLine(),
          ListTile(
            leading: const Icon(Icons.remove_circle_outline),
            title: const Text('Add expense'),
            onTap: () {
              final repo = ref.read(transactionsProvider);
              Navigator.pop(context);
              showSheet(
                context,
                AddTransactionFormSheet(
                  titleText: 'Add expense',
                  onSubmit: (title, amount) async {
                    await repo.add(
                      TransactionModel(
                        title: title,
                        amount: amount,
                        isIncome: false,
                        createdAt: DateTime.now(),
                      ),
                    );
                  },
                ),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.add_circle_outline),
            title: const Text('Add income'),
            onTap: () {
              final repo = ref.read(transactionsProvider);
              Navigator.pop(context);
              showSheet(
                context,
                AddTransactionFormSheet(
                  titleText: 'Add income',
                  onSubmit: (title, amount) async {
                    repo.add(
                      TransactionModel(
                        amount: amount,
                        title: title,
                        createdAt: DateTime.now(),
                        isIncome: true,
                      ),
                    );
                  },
                ),
              );
            },
          ),
          SizedBox(height: 40),
        ],
      ),
    );
  }
}
