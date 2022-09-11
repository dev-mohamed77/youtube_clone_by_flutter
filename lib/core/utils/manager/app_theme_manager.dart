import 'package:flutter/material.dart';
import 'package:youtube_clone/core/utils/manager/app_color_manager.dart';

class AppThemeManager {
  static ThemeData lightTheme = ThemeData(
    fontFamily: "Quicksand",
    scaffoldBackgroundColor: AppColorManager.primaryColor,
    appBarTheme: const AppBarTheme(
      iconTheme: IconThemeData(
        color: AppColorManager.darkColor,
      ),
      color: AppColorManager.primaryColor,
      elevation: 0,
    ),
    textTheme: const TextTheme(
      bodyText1: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: AppColorManager.blackColor,
      ),
      bodyText2: TextStyle(
        fontSize: 16,
        color: AppColorManager.blackColor,
      ),
    ),
    iconTheme: const IconThemeData(
      color: AppColorManager.blackColor,
    ),
  );

  static ThemeData darkTheme = ThemeData(
    fontFamily: "Quicksand",
    scaffoldBackgroundColor: AppColorManager.darkColor,
    appBarTheme: const AppBarTheme(
      iconTheme: IconThemeData(
        color: AppColorManager.whiteColor,
      ),
      color: AppColorManager.darkColor,
      elevation: 0,
    ),
    textTheme: const TextTheme(
      bodyText1: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: AppColorManager.whiteColor,
      ),
      bodyText2: TextStyle(
        fontSize: 16,
        color: AppColorManager.whiteColor,
      ),
    ),
    iconTheme: const IconThemeData(
      color: AppColorManager.blackColor,
    ),
  );
}
