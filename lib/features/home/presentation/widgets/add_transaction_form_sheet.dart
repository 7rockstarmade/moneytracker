import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:moneytracker/features/home/providers/providers.dart';
import 'package:moneytracker/features/shared/presentation/sheet_gradient_button.dart';

class AddTransactionFormSheet extends ConsumerWidget {
  final String titleText;
  final void Function(String title, double amount) onSubmit;

  const AddTransactionFormSheet({
    super.key,
    required this.titleText,
    required this.onSubmit,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bottomInset = MediaQuery.of(context).viewInsets.bottom;

    return Padding(
      padding: EdgeInsets.fromLTRB(16, 12, 16, 16 + bottomInset),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // modal line
          Center(
            child: Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: Colors.black26,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ),
          const SizedBox(height: 16),

          Text(
            titleText,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 20),

          // TITLE
          TextFormField(
            initialValue: ref.watch(txTitleProvider),
            onChanged: (v) => ref.read(txTitleProvider.notifier).state = v,
            textInputAction: TextInputAction.next,
            decoration: const InputDecoration(
              labelText: 'Title',
              hintText: 'Coffee, Salary, Taxi',
            ),
          ),
          const SizedBox(height: 12),

          // AMOUNT
          TextFormField(
            initialValue: ref.watch(txAmountProvider),
            onChanged: (v) => ref.read(txAmountProvider.notifier).state = v,
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            decoration: const InputDecoration(
              labelText: 'Amount',
              hintText: '12.50',
            ),
          ),

          SizedBox(height: 50),
          GradientButton(
            text: 'Add transaction',
            onPressed: () {
              final title = ref.read(txTitleProvider).trim();
              final raw = ref
                  .read(txAmountProvider)
                  .trim()
                  .replaceAll(' ', '')
                  .replaceAll(',', '.');

              final amount = double.tryParse(raw);

              if (title.isEmpty || amount == null || amount <= 0) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Enter valid data')),
                );
                return;
              }

              onSubmit(title, amount);
              Navigator.pop(context);
            },
          ),
          SizedBox(height: 30),
        ],
      ),
    );
  }
}
