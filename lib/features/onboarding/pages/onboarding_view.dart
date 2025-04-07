import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widgets/onboarding_bottom_nav_bar.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(24.w, 40.h, 42.w, 0),
            child: Text(
              "Define yourself in your unique way.",
              style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
                fontSize: 64,
                fontWeight: FontWeight.w600,
                height: 1,
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Image.asset(
              "assets/images/onboarding_pattern.png",
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            right: 0,
            bottom: 107.h,
            child: Image.asset(
              "assets/images/onboarding_person.png",
              fit: BoxFit.fitWidth,
            ),
          ),
        ],
      ),
      bottomNavigationBar: OnboardingBottomNavBar(),
    );
  }
}
