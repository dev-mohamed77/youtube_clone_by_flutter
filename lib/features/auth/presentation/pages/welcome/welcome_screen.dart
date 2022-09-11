import 'package:flutter/material.dart';
import 'package:youtube_clone/core/components/responsive.dart';
import 'package:youtube_clone/features/auth/presentation/pages/welcome/welcome_screen_large.dart';
import 'package:youtube_clone/features/auth/presentation/pages/welcome/welcome_screen_small.dart';

import '../../../../../core/utils/manager/app_navigator_manager.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  static const String id = "/WelcomeScreen";

  static Route route() => AppNavigatorManager.navigatorMaterialPush(
        id,
        const WelcomeScreen(),
      );

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Responsive(
        mobile: WelcomeScreenSmall(),
        desktop: WelcomeScreenLarge(),
      ),
    );
  }
}
