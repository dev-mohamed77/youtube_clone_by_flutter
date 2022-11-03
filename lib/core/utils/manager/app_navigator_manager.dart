import 'package:flutter/material.dart';

class AppNavigatorManager {
  static Route navigatorMaterialPush(String name, Widget screen) {
    return MaterialPageRoute(
      settings: RouteSettings(name: name),
      builder: (context) => screen,
    );
  }

  static navigatorPushAndReplace(BuildContext ctx, String name, Widget screen) {
    Navigator.pushAndRemoveUntil(
      ctx,
      navigatorMaterialPush(name, screen),
      (route) => false,
    );
  }

  static void navigatorPush(BuildContext ctx, Widget screen) {
    Navigator.of(ctx).push(
      MaterialPageRoute(builder: (ctx) => screen),
    );
  }
}
