import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../app/theme/app_colors.dart';

class AppBottomNavigation extends StatelessWidget {
  const AppBottomNavigation({super.key});

  int _getCurrentIndex(BuildContext context) {
    final location = GoRouterState.of(context).uri.path;

    if (location.startsWith('/discover')) return 1;
    if (location.startsWith('/planning')) return 2;
    if (location.startsWith('/concierge')) return 3;
    if (location.startsWith('/profile')) return 4;

    return 0;
  }

  void _onItemSelected(BuildContext context, int index) {
    final routes = [
      '/',
      '/discover',
      '/planning',
      '/concierge',
      '/profile',
    ];

    context.go(routes[index]);
  }

  @override
  Widget build(BuildContext context) {
    final currentIndex = _getCurrentIndex(context);

    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: (index) => _onItemSelected(context, index),
      selectedItemColor: AppColors.darkWine,
      unselectedItemColor: AppColors.textMuted,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.diamond_outlined),
          activeIcon: Icon(Icons.diamond),
          label: 'HOME',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.auto_awesome_outlined),
          activeIcon: Icon(Icons.auto_awesome),
          label: 'DISCOVER',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.calendar_month_outlined),
          activeIcon: Icon(Icons.calendar_month),
          label: 'PLANNING',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.room_service_outlined),
          activeIcon: Icon(Icons.room_service),
          label: 'CONCIERGE',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.workspace_premium_outlined),
          activeIcon: Icon(Icons.workspace_premium),
          label: 'PROFILE',
        ),
      ],
    );
  }
}