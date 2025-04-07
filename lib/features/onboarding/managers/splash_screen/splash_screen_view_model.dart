import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:store_app/core/routing/router.dart';
import 'package:store_app/core/routing/routes.dart';

class SplashScreenViewModel extends ChangeNotifier {
  SplashScreenViewModel() {
    // Future.delayed(
    //   Duration(milliseconds: 3000),
    // ).then((value) => navigatorKey.currentContext!.go(Routes.onboarding));
  }
}
