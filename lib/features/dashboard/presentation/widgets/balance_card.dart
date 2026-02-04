import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:moneytracker/core/theme/app_colors.dart';

class BalanceCard extends ConsumerWidget {
  final Color? color;
  final Color elementColor;
  final LinearGradient? gradient;
  const BalanceCard({
    super.key,
    this.color,
    this.gradient,
    this.elementColor = AppColors.neutral2,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      width: 120,
      height: 140,
      padding: EdgeInsets.all(15),
      margin: const EdgeInsets.only(right: 12),
      decoration: BoxDecoration(
        color: color,
        gradient: gradient,
        borderRadius: .circular(20),
        boxShadow: [
          BoxShadow(color: const Color.fromARGB(24, 0, 0, 0), blurRadius: 12),
        ],
      ),
      child: Column(
        crossAxisAlignment: .start,
        children: [
          SvgPicture.asset(
            'assets/icons/wallet_black.svg',
            colorFilter: ColorFilter.mode(elementColor, .srcIn),
          ),
          Padding(
            padding: EdgeInsetsGeometry.directional(top: 8, bottom: 30),
            child: Text(
              "Total Salary",
              style: TextStyle(
                fontSize: 12,
                color: elementColor,
                fontWeight: .w500,
              ),
            ),
          ),
          Text("1234.23", style: TextStyle(color: elementColor, fontSize: 18)),
        ],
      ),
    );
  }
}
