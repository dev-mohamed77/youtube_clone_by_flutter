import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:youtube_clone/features/auth/presentation/pages/login/login_screen.dart';
import 'package:youtube_clone/features/auth/presentation/pages/register/register_screen.dart';
import 'package:youtube_clone/features/auth/presentation/pages/welcome/welcome_screen.dart';
import 'package:youtube_clone/features/home/presentation/pages/home_screen.dart';
import 'package:youtube_clone/features/splash/presentation/pages/splash_screen.dart';
import 'package:youtube_clone/features/video_player/presentation/pages/video_player_screen.dart';

class AppRouteManager {
  static Route route(RouteSettings settings) {
    switch (settings.name) {
      case SplashScreen.id:
        return SplashScreen.route();
      case LoginScreen.id:
        return LoginScreen.route();
      case WelcomeScreen.id:
        return WelcomeScreen.route();
      case RegisterScreen.id:
        return RegisterScreen.route();
      case HomeScreen.id:
        return HomeScreen.route();
      case VideoPlayerScreen.id:
        return VideoPlayerScreen.route();
      default:
        return HomeScreen.route();
    }
  }
}
