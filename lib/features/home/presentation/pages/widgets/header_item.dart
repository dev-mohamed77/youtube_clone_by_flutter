import 'package:flutter/material.dart';

import '../../../../../core/utils/manager/app_color_manager.dart';

class HeaderItem extends StatelessWidget {
  const HeaderItem({
    Key? key,
    required this.title,
    required this.icon,
    double? fontSize,
    Color? iconColor,
    Color? textColor,
    Color? radiusColor,
    bool? isCircular,
    required this.onClick,
  })  : _fontSize = fontSize ?? 15,
        _iconColor = iconColor ?? AppColorManager.blackColor,
        _textColor = textColor ?? AppColorManager.blackColor,
        _radiusColor = radiusColor ?? AppColorManager.greyColor,
        _isCircular = isCircular ?? false,
        super(key: key);

  final String title;
  final IconData icon;
  final Color _iconColor;
  final double _fontSize;
  final Color _textColor;
  final bool _isCircular;
  final Color _radiusColor;
  final void Function()? onClick;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onClick,
      leading: _isCircular
          ? CircleAvatar(
              radius: 13,
              backgroundColor: _radiusColor,
              child: Icon(
                icon,
                color: _iconColor,
                size: 15,
              ),
            )
          : Icon(
              icon,
              color: _iconColor,
            ),
      title: Text(
        title,
        style: Theme.of(context)
            .textTheme
            .bodyText1!
            .copyWith(fontSize: _fontSize, color: _textColor, shadows: [
          const BoxShadow(
            color: AppColorManager.greyColor,
            blurRadius: 30,
            offset: Offset(0.0, 10),
          )
        ]),
      ),
    );
  }
}
