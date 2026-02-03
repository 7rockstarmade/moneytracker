import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:moneytracker/core/theme/app_colors.dart';
import 'package:moneytracker/features/dashboard/presentation/widgets/balance_card.dart';
import 'package:moneytracker/features/shared/presentation/expense_list_item.dart';

class DashboardPage extends ConsumerWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Container(
            height: 166,
            color: AppColors.neutral3,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsetsGeometry.all(16),
              itemCount: 12,
              itemBuilder: (context, i) {
                return BalanceCard(color: Colors.white);
              },
            ),
          ),
        ),

        const SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsetsGeometry.all(16),
            child: Text(
              "Latest",
              style: TextStyle(
                color: AppColors.neutral2,
                fontSize: 20,
                fontWeight: .w500,
              ),
            ),
          ),
        ),

        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) => ExpenseListItem(
              title: "Iten $index",
              subtitle: "Some data",
              trailing: "€12.50",
            ),
            childCount: 30,
          ),
        ),

        const SliverToBoxAdapter(child: SizedBox(height: 24)),
      ],
    );
  }
}
