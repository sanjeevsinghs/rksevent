import 'package:flutter/material.dart';

import '../services/onboarding_service.dart';
import 'app.dart';

class AppStart extends StatefulWidget {
  const AppStart({super.key});

  @override
  State<AppStart> createState() => _AppStartState();
}

class _AppStartState extends State<AppStart> {
  final OnboardingService _onboardingService = OnboardingService();

  bool? _isOnboardingSeen;

  @override
  void initState() {
    super.initState();
    _checkOnboarding();
  }

  Future<void> _checkOnboarding() async {
    final result = await _onboardingService.isOnboardingSeen();

    if (!mounted) return;

    setState(() {
      _isOnboardingSeen = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    final isOnboardingSeen = _isOnboardingSeen;
    if (isOnboardingSeen == null) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    return RksEventApp(
      initialLocation: isOnboardingSeen ? '/' : '/onboarding',
    );
  }
}
