import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:moneytracker/core/theme/app_colors.dart';
import 'package:moneytracker/core/theme/theme_provider.dart';

class AppBottomBar extends ConsumerWidget {
  const AppBottomBar({super.key, required this.location});

  final String location;

  static const _tabs = <String>[
    '/dashboard',
    '/transactions',
    '/stats',
    '/settings',
  ];

  int _locationToIndex(String loc) {
    final idx = _tabs.indexWhere((t) => loc.startsWith(t));
    return idx == -1 ? 0 : idx;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentIndex = _locationToIndex(location);
    final isDarkTheme = ref.watch(themeProvider);
    final Color colorWhenDark = isDarkTheme ? Colors.white : AppColors.neutral2;
    Color iconColor(int index) {
      return index == currentIndex ? colorWhenDark : AppColors.neutral1;
    }

    return BottomAppBar(
      height: 70,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: () => context.go('/dashboard'),
            icon: SvgPicture.asset(
              'assets/icons/home.svg',
              width: 30,
              height: 30,
              colorFilter: ColorFilter.mode(iconColor(0), BlendMode.srcIn),
            ),
          ),
          IconButton(
            onPressed: () => context.go('/transactions'),
            icon: SvgPicture.asset(
              'assets/icons/bell.svg',
              width: 30,
              height: 30,
              colorFilter: ColorFilter.mode(iconColor(1), BlendMode.srcIn),
            ),
          ),
          const SizedBox(width: 70),
          IconButton(
            onPressed: () => context.go('/stats'),
            icon: SvgPicture.asset(
              'assets/icons/task.svg',
              width: 30,
              height: 30,
              colorFilter: ColorFilter.mode(iconColor(2), BlendMode.srcIn),
            ),
          ),
          IconButton(
            onPressed: () => context.go('/settings'),
            icon: SvgPicture.asset(
              'assets/icons/settings.svg',
              width: 30,
              height: 30,
              colorFilter: ColorFilter.mode(iconColor(3), BlendMode.srcIn),
            ),
          ),
        ],
      ),
    );
  }
}
