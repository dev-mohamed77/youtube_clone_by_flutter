import 'package:flutter/material.dart';
import 'package:youtube_clone/features/splash/presentation/pages/widgets/splash_image_handle.dart';

class SplashScreenSmall extends StatelessWidget {
  const SplashScreenSmall({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: SplashImageHandle(),
    );
  }
}
