import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreenView extends StatelessWidget {
  const SplashScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Image.asset("assets/images/splash.png", width: double.infinity, height: double.infinity, fit: BoxFit.cover),
          Positioned(
            bottom: 60,
            child: SizedBox(width: 64, height: 64, child: CircularProgressIndicator(color: Colors.white)),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final prefs = await SharedPreferences.getInstance();
          await prefs.setBool("onboardingDone", false);
        },
      ),
    );
  }
}
