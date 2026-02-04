import 'package:flutter/material.dart';
import 'package:moneytracker/core/theme/app_colors.dart';
import 'package:moneytracker/features/home/presentation/widgets/add_transaction_sheet.dart';
import 'package:moneytracker/features/shared/presentation/show_sheet.dart';

Material floatingActionButton(BuildContext context) {
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
        onTap: () {
          showSheet(context, AddTransactionSheet());
        },
        child: const SizedBox(
          width: 80,
          height: 80,
          child: Icon(Icons.add, color: Colors.white, size: 40),
        ),
      ),
    ),
  );
}
