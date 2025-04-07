import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:store_app/core/routing/routes.dart';

import '../../common/widgets/store_text_button.dart';

class OnboardingBottomNavBar extends StatelessWidget {
  const OnboardingBottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 107.h,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(top: BorderSide(color: Theme.of(context).colorScheme.secondary)),
      ),
      child: StoreTextButton(
        text: "Get Started",
        width: 341.w,
        height: 54.h,
        showArrow: true,
        callback: () => context.go(Routes.signUp),
      ),
    );
  }
}
