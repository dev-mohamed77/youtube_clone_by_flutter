import 'package:flutter/material.dart';
import 'package:youtube_clone/features/splash/presentation/pages/widgets/splash_image_handle.dart';

class SplashScreenLarge extends StatelessWidget {
  const SplashScreenLarge({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: SplashImageHandle(
        width: 120,
      ),
    );
  }
}
