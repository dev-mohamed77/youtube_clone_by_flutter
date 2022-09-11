import 'package:flutter/material.dart';
import 'package:youtube_clone/core/utils/config/strings_config.dart';

import '../utils/manager/app_color_manager.dart';

class OutlinedButtonLoginCustom extends StatelessWidget {
  const OutlinedButtonLoginCustom({
    Key? key,
    Color? iconColor,
    double? width,
    double? height,
  })  : _iconColor = iconColor ?? AppColorManager.blueColor,
        _width = width ?? 80,
        _height = height ?? 40,
        super(key: key);

  final Color _iconColor;
  final double _width;
  final double _height;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () {},
      child: SizedBox(
        width: _width,
        height: _height,
        child: Row(
          children: [
            Icon(
              Icons.person,
              color: _iconColor,
            ),
            Text(
              StringsConfig.signIn,
              style: TextStyle(color: Colors.blue[800]),
            ),
          ],
        ),
      ),
    );
  }
}
