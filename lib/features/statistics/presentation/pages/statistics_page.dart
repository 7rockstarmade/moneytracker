import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:moneytracker/core/theme/app_colors.dart';
import 'package:moneytracker/core/theme/theme_provider.dart';
import 'package:moneytracker/features/statistics/presentation/widgets/stat_circle.dart';
import 'package:moneytracker/features/transactions/providers/transactions_provider.dart';

class StatisticsPage extends ConsumerWidget {
  const StatisticsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final repo = ref.watch(transactionsProvider);
    final isDarkTheme = ref.watch(themeProvider);
    return ValueListenableBuilder(
      valueListenable: repo.listenable(),
      builder: (context, value, child) {
        final double count = repo.getTotalIncome() - repo.getTotalExpense();
        return CustomScrollView(
          slivers: [
            SliverToBoxAdapter(child: SizedBox(height: 45)),
            SliverToBoxAdapter(
              child: Center(
                child: Column(
                  children: [
                    Text(
                      "All time",
                      style: TextStyle(
                        color: isDarkTheme
                            ? Color.fromARGB(255, 190, 190, 190)
                            : AppColors.neutral2,
                        fontSize: 20,
                      ),
                    ),
                    Text(
                      "Expenses",
                      style: TextStyle(fontSize: 40, fontWeight: .w600),
                    ),
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(child: SizedBox(height: 45)),
            SliverToBoxAdapter(
              child: Center(child: StatisticsCircle(amount: count.toString())),
            ),
            SliverToBoxAdapter(child: SizedBox(height: 45)),
            SliverToBoxAdapter(
              child: Center(
                child: SizedBox(
                  width: 300,
                  child: Text(
                    (count > 0)
                        ? "You've been making money using the app! Keep up the good work."
                        : "You're in the red, keep using the app to learn about the financial world.",
                    textAlign: .center,

                    style: TextStyle(),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
