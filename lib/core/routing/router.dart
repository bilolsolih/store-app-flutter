import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:store_app/core/routing/routes.dart';
import 'package:store_app/features/authentication/pages/enter_otp_view.dart';
import 'package:store_app/features/authentication/pages/forgot_password_view.dart';
import 'package:store_app/features/authentication/pages/login_view.dart';
import 'package:store_app/features/authentication/pages/sign_up_view.dart';
import 'package:store_app/features/onboarding/pages/onboarding_view.dart';
import 'package:store_app/features/onboarding/pages/splash_screen_view.dart';

final navigatorKey = GlobalKey<NavigatorState>();

final GoRouter router = GoRouter(
  navigatorKey: navigatorKey,
  initialLocation: Routes.enterOtp,
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
    GoRoute(path: Routes.login, builder: (context, state) => LoginView()),
    GoRoute(
      path: Routes.forgotPassword,
      builder: (context, state) => ForgotPasswordView(),
    ),
    GoRoute(
      path: Routes.enterOtp,
      builder: (context, state) {
        return EnterOtpView(
          emailAddress:
              state.extra == null
                  ? "Example@example.com"
                  : state.extra as String,
        );
      },
    ),
  ],
);
