import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:store_app/core/routing/routes.dart';
import 'package:store_app/features/address/managers/new_address_bloc.dart';
import 'package:store_app/features/address/pages/new_address_view.dart';
import 'package:store_app/features/authentication/pages/enter_otp_view.dart';
import 'package:store_app/features/authentication/pages/forgot_password_view.dart';
import 'package:store_app/features/authentication/pages/login_view.dart';
import 'package:store_app/features/authentication/pages/reset_password_view.dart';
import 'package:store_app/features/authentication/pages/sign_up_view.dart';
import 'package:store_app/features/home/pages/home_view.dart';
import 'package:store_app/features/onboarding/managers/splash_screen/splash_screen_view_model.dart';
import 'package:store_app/features/onboarding/pages/onboarding_view.dart';
import 'package:store_app/features/onboarding/pages/splash_screen_view.dart';

final navigatorKey = GlobalKey<NavigatorState>();

final GoRouter router = GoRouter(
  navigatorKey: navigatorKey,
  initialLocation: Routes.newAddress,
  routes: [
    GoRoute(
      path: Routes.splashScreen,
      builder: (context, state) {
        return ChangeNotifierProvider(
          create: (context) => SplashScreenViewModel(),
          lazy: false,
          child: SplashScreenView(),
        );
      },
    ),
    GoRoute(path: Routes.onboarding, builder: (context, state) => OnboardingView()),
    GoRoute(path: Routes.signUp, builder: (context, state) => SignUpView()),
    GoRoute(path: Routes.login, builder: (context, state) => LoginView()),
    GoRoute(path: Routes.forgotPassword, builder: (context, state) => ForgotPasswordView()),
    GoRoute(
      path: Routes.enterOtp,
      builder:
          (context, state) =>
              EnterOtpView(emailAddress: state.extra == null ? "Example@example.com" : state.extra as String),
    ),
    GoRoute(path: Routes.resetPassword, builder: (context, state) => ResetPasswordView()),
    GoRoute(path: Routes.home, builder: (context, state) => HomeView()),
    GoRoute(
      path: Routes.newAddress,
      builder: (context, state) => BlocProvider(create: (context) => NewAddressBloc(), child: NewAddressView()),
    ),
  ],
);
