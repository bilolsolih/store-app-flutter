import 'package:provider/provider.dart';
import 'package:store_app/features/onboarding/managers/splash_screen/splash_screen_view_model.dart';

final dependencies = [
  ChangeNotifierProvider(
    create: (context) => SplashScreenViewModel(),
    lazy: false,
  ),
];
