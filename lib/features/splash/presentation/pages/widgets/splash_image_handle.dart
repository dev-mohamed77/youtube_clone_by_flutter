import 'package:flutter/material.dart';

import '../../../../../core/utils/config/assets_config.dart';

class SplashImageHandle extends StatelessWidget {
  const SplashImageHandle({
    Key? key,
    double? width,
  })  : _width = width ?? 70,
        super(key: key);
  final double _width;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      AssetsConfig.youtube_icon,
      width: _width,
    );
  }
}
