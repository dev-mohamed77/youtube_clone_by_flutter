import 'package:flutter/material.dart';
import 'package:youtube_clone/core/utils/config/assets_config.dart';

class ErrorImageHandle extends StatelessWidget {
  const ErrorImageHandle({Key? key, double? width, String? pathImage})
      : _width = width ?? 150,
        _pathImage = pathImage ?? AssetsConfig.no_result,
        super(key: key);

  final double _width;
  final String _pathImage;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      _pathImage,
      width: _width,
    );
  }
}
