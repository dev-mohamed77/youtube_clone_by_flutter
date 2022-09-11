import 'package:flutter/material.dart';

import '../../../../../../core/utils/manager/app_color_manager.dart';

class SocialButton extends StatelessWidget {
  const SocialButton({
    Key? key,
    required this.onClick,
    required this.icon,
    required this.iconColor,
    double? iconSize,
  })  : _iconSize = iconSize ?? 24,
        super(key: key);

  final Function() onClick;
  final IconData icon;
  final Color iconColor;
  final double _iconSize;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(15),
      onTap: onClick,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
        decoration: BoxDecoration(
          color: AppColorManager.accentColor,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: AppColorManager.greyColor.withOpacity(0.8),
              blurRadius: 12,
              offset: const Offset(0, 5),
            )
          ],
        ),
        child: Icon(
          icon,
          color: iconColor,
          size: _iconSize,
        ),
      ),
    );
  }
}
