import 'package:shared_preferences/shared_preferences.dart';


class OnboardingService {
  static const String _onboardingKey ='onbording_seen';  

  Future<bool> isOnboardingSeen() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_onboardingKey) ?? false;
  }

  Future<void> setOnboardingSeen() async {
    final prefs = await SharedPreferences.getInstance();

    // await prefs.remove(_onboardingKey); // Remove the existing key-value pair
    await prefs.setBool(_onboardingKey, true); // Set the new key-value pair
  }
}