import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:moneytracker/core/theme/app_colors.dart';
import 'package:moneytracker/features/dashboard/presentation/widgets/balance_card.dart';

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

        // Отступ перед данными
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
            (context, index) => ListTile(
              title: Text('Item $index'),
              subtitle: const Text('Some data'),
              trailing: const Text('€12.50'),
            ),
            childCount: 30,
          ),
        ),

        const SliverToBoxAdapter(child: SizedBox(height: 24)),
      ],
    );
  }
}
