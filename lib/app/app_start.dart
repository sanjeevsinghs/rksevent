import 'package:flutter/material.dart';
import '../../services/onboarding_service.dart';
import '../features/onboarding/pages/onboarding_page.dart';
import '../app/app.dart';

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
    if (_isOnboardingSeen == null) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }


  return MaterialApp(
  debugShowCheckedModeBanner: false,
  home: _isOnboardingSeen == false
      ? const OnboardingPage()
      : const OnboardingPage(),
);
  //   if (_isOnboardingSeen == false) {
  //     return const OnboardingPage();
  //   } else {
  //     return RksEventApp();
  //   }
  }
}