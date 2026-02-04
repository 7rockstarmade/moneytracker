import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:moneytracker/core/theme/app_colors.dart';

class StatisticsCircle extends ConsumerWidget {
  final String amount;
  const StatisticsCircle({super.key, required this.amount});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Material(
      shape: const CircleBorder(),
      elevation: 7,
      child: Ink(
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          gradient: AppColors.bluegradient,
        ),
        child: InkWell(
          customBorder: const CircleBorder(),
          onTap: () {},
          child: SizedBox(
            width: 200,
            height: 200,
            child: Center(
              child: Text(
                amount,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: .w600,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
