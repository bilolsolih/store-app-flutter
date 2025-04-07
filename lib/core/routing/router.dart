import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:store_app/core/routing/routes.dart';
import 'package:store_app/features/authentication/pages/sign_up_view.dart';
import 'package:store_app/features/onboarding/pages/onboarding_view.dart';
import 'package:store_app/features/onboarding/pages/splash_screen_view.dart';

final navigatorKey = GlobalKey<NavigatorState>();

final GoRouter router = GoRouter(
  navigatorKey: navigatorKey,
  initialLocation: Routes.signUp,
  routes: [
    GoRoute(
      path: Routes.splashScreen,
      builder: (context, state) => SplashScreenView(),
    ),
    GoRoute(
      path: Routes.onboarding,
      builder: (context, state) => OnboardingView(),
    ),
    GoRoute(path: Routes.signUp, builder: (context, state) => SignUpView()),
  ],
);
