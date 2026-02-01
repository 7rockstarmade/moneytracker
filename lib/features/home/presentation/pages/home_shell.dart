import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:moneytracker/core/theme/app_colors.dart';
import 'package:moneytracker/features/home/presentation/widgets/botton_navigation_bar.dart';
import 'package:moneytracker/features/home/presentation/widgets/floating_action_button.dart';

class HomeShell extends ConsumerWidget {
  const HomeShell({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text(
          "Overview",
          style: TextStyle(
            color: AppColors.neutral2,
            fontSize: 24,
            fontWeight: .w500,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Transform.translate(
        offset: const Offset(0, 20),
        child: floatingActionButton(),
      ),
      bottomNavigationBar: bottomNavigationBar(),
    );
  }
}
