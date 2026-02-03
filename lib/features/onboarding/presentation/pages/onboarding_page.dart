import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:moneytracker/core/theme/app_colors.dart';
import 'package:moneytracker/features/onboarding/providers/startup_provider.dart';

class OnBoardingPage extends ConsumerWidget {
  const OnBoardingPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsetsGeometry.directional(
                  top: 60,
                  bottom: 70,
                ),
                child: Row(
                  mainAxisAlignment: .center,
                  spacing: 5,
                  children: [
                    Image.asset(
                      'assets/images/logo.png',
                      width: 40,
                      height: 40,
                    ),
                    Text(
                      "moneytracker",
                      style: TextStyle(fontSize: 20, fontWeight: .bold),
                    ),
                  ],
                ),
              ),
              SvgPicture.asset(
                'assets/images/taxi-its-raining-money.svg',
                width: 250,
                height: 226,
              ),
              Padding(
                padding: EdgeInsetsGeometry.directional(top: 86, bottom: 16),
                child: Text(
                  "Note down expenses",
                  style: TextStyle(fontSize: 20, fontWeight: .w500),
                ),
              ),
              Text(
                "Daily note your expenses to \nhelp manage money",
                textAlign: .center,
                style: TextStyle(color: AppColors.neutral1),
              ),
              Padding(
                padding: EdgeInsetsGeometry.directional(top: 77),
                child: TextButton(
                  onPressed: () {
                    ref.read(startUpProvider.notifier).markOnBoardingSeen();
                    if (context.mounted) context.go('/dashboard');
                  },
                  child: Container(
                    width: 327,
                    height: 48,
                    decoration: BoxDecoration(
                      borderRadius: .circular(14),
                      gradient: AppColors.bluegradient,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 10,
                          offset: Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Center(
                      child: Text(
                        "LET`S GO!",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: .w600,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
