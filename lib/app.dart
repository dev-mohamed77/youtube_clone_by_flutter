import 'package:flutter/material.dart';
import 'package:youtube_clone/core/utils/manager/app_route_manager.dart';
import 'package:youtube_clone/core/utils/manager/app_theme_manager.dart';
import 'package:youtube_clone/features/splash/presentation/pages/splash_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppThemeManager.lightTheme,
      initialRoute: SplashScreen.id,
      onGenerateRoute: AppRouteManager.route,
    );
  }
}
