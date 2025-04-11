import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:store_app/core/dependencies.dart';
import 'package:store_app/core/routing/router.dart';
import 'package:store_app/core/utils/themes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final dir = await getApplicationDocumentsDirectory();
  Hive.init(dir.path);
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  runApp(ScreenUtilInit(designSize: const Size(390, 844), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: dependencies,
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        theme: AppThemes.lightTheme,
        routerConfig: router,
      ),
    );
  }
}
