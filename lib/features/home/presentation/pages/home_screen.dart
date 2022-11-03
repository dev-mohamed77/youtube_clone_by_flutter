import 'package:flutter/material.dart';
import 'package:youtube_clone/core/components/responsive.dart';
import 'package:youtube_clone/features/home/presentation/pages/home_screen_large.dart';
import 'package:youtube_clone/features/home/presentation/pages/home_screen_small.dart';
import '../../../../core/utils/manager/app_navigator_manager.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  static const String id = "/HomeScreen";

  static Route route() => AppNavigatorManager.navigatorMaterialPush(
        id,
        const HomeScreen(),
      );

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Responsive(
        mobile: HomeScreenSmall(),
        desktop: HomeScreenLarge(),
      ),
    );
  }
}
