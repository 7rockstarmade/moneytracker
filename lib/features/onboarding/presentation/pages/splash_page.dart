import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:moneytracker/features/onboarding/providers/startup_provider.dart';

class SplashPage extends ConsumerWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(startUpProvider, (prev, next) {
      if (next is AsyncData) {
        context.go('/dashboard');
      }
    });
    return Scaffold(
      body: Center(
        child: Column(
          spacing: 10,
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset('assets/images/logo.png'),
            Text(
              "moneytracker",
              style: TextStyle(
                fontFamily: "Hind",
                fontSize: 38,
                fontWeight: .bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
