import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../features/concierge/concierge_page.dart';
import '../../features/discover/discover_page.dart';
import '../../features/home/pages/home_page.dart';
import '../../features/planning/planning_page.dart';
import '../../features/profile/profile_page.dart';
import '../../features/shared/widgets/app_bottom_navigation.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    ShellRoute(
      builder: (context, state, child) {
        return AppNavigationShell(child: child);
      },
      routes: [
        GoRoute(
          path: '/',
          name: 'home',
          pageBuilder: (context, state) {
            return const NoTransitionPage(
              child: HomePage(),
            );
          },
        ),
        GoRoute(
          path: '/discover',
          name: 'discover',
          pageBuilder: (context, state) {
            return const NoTransitionPage(
              child: DiscoverPage(),
            );
          },
        ),
        GoRoute(
          path: '/planning',
          name: 'planning',
          pageBuilder: (context, state) {
            return const NoTransitionPage(
              child: PlanningPage(),
            );
          },
        ),
        GoRoute(
          path: '/concierge',
          name: 'concierge',
          pageBuilder: (context, state) {
            return const NoTransitionPage(
              child: ConciergePage(),
            );
          },
        ),
        GoRoute(
          path: '/profile',
          name: 'profile',
          pageBuilder: (context, state) {
            return const NoTransitionPage(
              child: ProfilePage(),
            );
          },
        ),
      ],
    ),
  ],
);

class AppNavigationShell extends StatelessWidget {
  final Widget child;

  const AppNavigationShell({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: child,
      bottomNavigationBar: const AppBottomNavigation(),
    );
  }
}
