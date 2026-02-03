import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:moneytracker/core/theme/app_colors.dart';
import 'package:moneytracker/features/statistics/presentation/widgets/stat_circle.dart';

class StatisticsPage extends ConsumerWidget {
  const StatisticsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(child: SizedBox(height: 45)),
        SliverToBoxAdapter(
          child: Center(
            child: Column(
              children: [
                Text(
                  "All time",
                  style: TextStyle(color: AppColors.neutral2, fontSize: 20),
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
        SliverToBoxAdapter(child: Center(child: StatisticsCircle())),
        SliverToBoxAdapter(child: SizedBox(height: 45)),
        SliverToBoxAdapter(
          child: Center(
            child: SizedBox(
              width: 300,
              child: Text(
                "You've been making money using the app! Keep up the good work.",
                textAlign: .center,

                style: TextStyle(),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
