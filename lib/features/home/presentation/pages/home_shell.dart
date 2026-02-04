import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:moneytracker/core/theme/app_colors.dart';
import 'package:moneytracker/features/home/presentation/widgets/botton_navigation_bar.dart';
import 'package:moneytracker/features/home/presentation/widgets/floating_action_button.dart';

class HomeShell extends ConsumerWidget {
  final Widget child;
  final String location;
  const HomeShell({super.key, required this.child, required this.location});

  static const _titles = <String, String>{
    '/dashboard': 'Overview',
    '/transactions': 'Transactions',
    '/stats': 'Stats',
    '/settings': 'Settings',
  };

  String _locationToTitle(String loc) {
    for (final entry in _titles.entries) {
      if (loc.startsWith(entry.key)) return entry.value;
    }
    return 'Overview';
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final title = _locationToTitle(location);
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text(
          title,
          style: TextStyle(
            color: AppColors.neutral2,
            fontSize: 24,
            fontWeight: .w500,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Transform.translate(
        offset: const Offset(0, 25),
        child: floatingActionButton(context),
      ),
      bottomNavigationBar: AppBottomBar(location: location),
      body: child,
    );
  }
}
