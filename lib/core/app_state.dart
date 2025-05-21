import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:store_app/core/secure_storage.dart';

class AppState extends ChangeNotifier {
  AppState() {
    loadInitialState();
  }

  bool isInitialized = false;

  Future<bool> get isOnboardingDone async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool("onboardingDone") ?? false;
  }

  Future<bool> get isAuthenticated async {
    final jwtToken = await SecureStorage.getJwtToken();
    return jwtToken != null;
  }

  bool isLoggedIn = false;

  Future loadInitialState() async {
    await Future.delayed(Duration(seconds: 2));
    isInitialized = true;
    notifyListeners();
  }
}
