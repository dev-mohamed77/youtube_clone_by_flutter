import 'dart:async';

import 'package:flutter/material.dart';
import 'package:youtube_clone/core/components/responsive.dart';
import 'package:youtube_clone/features/auth/presentation/pages/welcome/welcome_screen.dart';
import 'package:youtube_clone/features/home/presentation/pages/home_screen.dart';
import 'package:youtube_clone/features/splash/presentation/pages/splash_screen_large.dart';
import 'package:youtube_clone/features/splash/presentation/pages/splash_screen_small.dart';

import '../../../../core/utils/manager/app_navigator_manager.dart';
import '../../../../getit_injection.dart';
import '../../../auth/data/datasource/auth_local_database.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);
  static const String id = "/SplashScreen";

  static Route route() => AppNavigatorManager.navigatorMaterialPush(
        id,
        const SplashScreen(),
      );

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    nextPage();
    super.initState();
  }

  void nextPage() async {
    final result = await getIt<AuthLocalDataSource>().getUser();
    Timer(
      const Duration(seconds: 2),
      () {
        if (result != null) {
          Navigator.of(context).pushReplacementNamed(HomeScreen.id);
        } else {
          AppNavigatorManager.navigatorPushAndReplace(
            context,
            WelcomeScreen.id,
            const WelcomeScreen(),
          );
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Responsive(
        mobile: SplashScreenSmall(),
        desktop: SplashScreenLarge(),
      ),
    );
  }
}
