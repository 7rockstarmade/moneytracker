import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:moneytracker/core/theme/theme_provider.dart';
import 'package:moneytracker/core/theme/app_colors.dart';
import 'package:moneytracker/features/dashboard/presentation/widgets/balance_card.dart';
import 'package:moneytracker/features/shared/presentation/expense_list_item.dart';
import 'package:moneytracker/features/transactions/providers/transactions_provider.dart';

class DashboardPage extends ConsumerWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final repo = ref.watch(transactionsProvider);
    final dateTimeFormatter = DateFormat('dd.MM.yyyy HH:mm');
    final isDarkTheme = ref.watch(themeProvider);
    return ValueListenableBuilder(
      valueListenable: repo.listenable(),
      builder: (context, value, child) {
        final latest = repo.latest(10);
        return CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Container(
                height: 166,

                decoration: BoxDecoration(
                  color: isDarkTheme
                      ? Color.fromARGB(36, 55, 55, 55)
                      : AppColors.neutral3,
                ),
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsetsGeometry.all(16),
                  itemCount: 2,
                  itemBuilder: (context, i) {
                    switch (i) {
                      case 0:
                        return BalanceCard(
                          color: isDarkTheme
                              ? const Color.fromARGB(255, 42, 43, 56)
                              : Colors.white,
                          elementColor: isDarkTheme
                              ? Colors.white
                              : AppColors.neutral2,
                          title: "Total expense",
                          amount: repo.getTotalExpense().toString(),
                        );
                      case 1:
                        return BalanceCard(
                          gradient: AppColors.bluegradient,
                          elementColor: Colors.white,
                          title: "Total income",
                          amount: repo.getTotalIncome().toString(),
                        );
                      default:
                        return SizedBox();
                    }
                  },
                ),
              ),
            ),

            SliverToBoxAdapter(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: .directional(
                    topStart: .circular(25),
                    topEnd: .circular(25),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsetsGeometry.all(16),
                  child: Text(
                    "Latest",
                    style: TextStyle(
                      color: isDarkTheme ? Colors.white : AppColors.neutral2,
                      fontSize: 20,
                      fontWeight: .w500,
                    ),
                  ),
                ),
              ),
            ),
            latest.isEmpty
                ? SliverToBoxAdapter(
                    child: Center(
                      child: SizedBox(
                        width: 200,
                        child: Text(
                          "You don`t have any transactions",
                          textAlign: .center,
                          style: TextStyle(
                            color: isDarkTheme
                                ? Colors.white
                                : AppColors.neutral2,
                            fontSize: 18,
                            fontWeight: .w400,
                          ),
                        ),
                      ),
                    ),
                  )
                : SliverList(
                    delegate: SliverChildBuilderDelegate((context, index) {
                      final transaction = latest[index];
                      return ExpenseListItem(
                        title: transaction.title,
                        subtitle: dateTimeFormatter.format(
                          transaction.createdAt,
                        ),
                        trailing: transaction.amount.toString(),
                        isIncome: transaction.isIncome,
                      );
                    }, childCount: latest.length),
                  ),

            const SliverToBoxAdapter(child: SizedBox(height: 24)),
          ],
        );
      },
    );
  }
}
