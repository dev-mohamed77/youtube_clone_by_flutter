import 'package:flutter/material.dart';

import '../utils/manager/app_color_manager.dart';

class ButtonCustom extends StatelessWidget {
  ButtonCustom({
    Key? key,
    required this.text,
    required this.onClick,
    double? width,
    Color? colorShadow,
    Color? color,
  })  : _width = width ?? 110,
        _colorShadow =
            colorShadow ?? AppColorManager.blueColor.withOpacity(0.25),
        _color = color ?? AppColorManager.blueColor,
        super(key: key);

  final String text;
  final void Function() onClick;
  final double _width;
  final Color _colorShadow;
  final Color _color;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      width: _width,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: _colorShadow,
            blurRadius: 10,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: ElevatedButton(
        onPressed: onClick,
        style: ElevatedButton.styleFrom(
          backgroundColor: _color,
          textStyle: Theme.of(context).textTheme.bodyText1,
        ),
        child: Text(text),
      ),
    );
  }
}
