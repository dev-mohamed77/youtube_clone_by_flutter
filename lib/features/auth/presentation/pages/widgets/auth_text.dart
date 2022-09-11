import 'package:flutter/material.dart';

import '../../../../../../core/utils/manager/app_color_manager.dart';

class AuthText extends StatelessWidget {
  const AuthText({
    Key? key,
    required this.text,
    double? fontSize,
  })  : _fontSize = fontSize ?? 18,
        super(key: key);
  final String text;
  final double _fontSize;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      child: Text(
        text,
        style: Theme.of(context).textTheme.bodyText1!.copyWith(
              color: AppColorManager.blueColor,
              fontSize: _fontSize,
            ),
      ),
    );
  }
}
