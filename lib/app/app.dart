import 'package:flutter/material.dart';

import 'router/app_router.dart';
import 'theme/app_theme.dart';

class RksEventApp extends StatelessWidget {
  final String initialLocation;

  const RksEventApp({
    super.key,
    this.initialLocation = '/',
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'RKS Events',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      routerConfig: createAppRouter(initialLocation: initialLocation),
    );
  }
}
