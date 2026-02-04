import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:moneytracker/core/startup/startup_provider.dart';

class SplashPage extends ConsumerWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final startup = ref.watch(startupProvider);
    startup.when(
      loading: () {
        showScaffold();
      },
      error: (error, stackTrace) {},
      data: (s) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (!context.mounted) return;
          context.go(s.seenOnboarding ? '/dashboard' : '/onboarding');
        });

        return showScaffold();
      },
    );

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

Scaffold showScaffold() {
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
