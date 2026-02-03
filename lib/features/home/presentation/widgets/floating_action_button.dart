import 'package:flutter/material.dart';
import 'package:moneytracker/core/theme/app_colors.dart';

Material floatingActionButton() {
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
        child: const SizedBox(
          width: 80,
          height: 80,
          child: Icon(Icons.add, color: Colors.white, size: 40),
        ),
      ),
    ),
  );
}
