import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:moneytracker/features/onboarding/presentation/pages/onboarding_page.dart';
import 'package:moneytracker/features/onboarding/presentation/pages/splash_page.dart';
import 'package:moneytracker/core/startup/startup_provider.dart';
import 'package:moneytracker/features/dashboard/presentation/pages/dashboard_page.dart';
import 'package:moneytracker/features/home/presentation/pages/home_shell.dart';
import 'package:moneytracker/features/settings/presentation/pages/settings_page.dart';
import 'package:moneytracker/features/statistics/presentation/pages/statistics_page.dart';
import 'package:moneytracker/features/transactions/presentation/pages/transactions_page.dart';

final routerProvider = Provider<GoRouter>((ref) {
  final startup = ref.watch(startupProvider);
  return GoRouter(
    initialLocation: '/splash',
    routes: [
      GoRoute(path: '/splash', builder: (context, state) => const SplashPage()),
      GoRoute(
        path: '/onboarding',
        builder: (context, state) => const OnBoardingPage(),
      ),
      ShellRoute(
        builder: (context, state, child) =>
            HomeShell(location: state.uri.toString(), child: child),
        routes: [
          GoRoute(
            path: '/dashboard',
            pageBuilder: (context, state) =>
                const NoTransitionPage(child: DashboardPage()),
          ),
          GoRoute(
            path: '/transactions',
            pageBuilder: (context, state) =>
                const NoTransitionPage(child: TransactionsPage()),
          ),
          GoRoute(
            path: '/stats',
            pageBuilder: (context, state) =>
                const NoTransitionPage(child: StatisticsPage()),
          ),
          GoRoute(
            path: '/settings',
            pageBuilder: (context, state) =>
                const NoTransitionPage(child: SettingsPage()),
          ),
        ],
      ),
    ],
    redirect: (context, state) {
      final loc = state.uri.toString();
      final startup = ref.watch(startupProvider);

      if (startup.isLoading || startup.hasError) {
        return loc == '/splash' ? null : '/splash';
      }

      if (loc == '/splash') return null;

      final seen = startup.value!.seenOnboarding;

      if (!seen && loc != '/onboarding') return '/onboarding';
      if (seen && loc == '/onboarding') return '/dashboard';

      return null;
    },
  );
});
