import 'package:flutter/material.dart';

import '../../../../../core/utils/config/assets_config.dart';
import '../../../../../core/utils/config/strings_config.dart';

class CustomSliverAppBar extends StatelessWidget {
  const CustomSliverAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      floating: true,
      leadingWidth: 120,
      titleTextStyle: Theme.of(context).textTheme.bodyLarge,
      leading: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Row(
          children: [
            Image.asset(
              AssetsConfig.youtube_icon,
              width: 30,
            ),
            const SizedBox(
              width: 5,
            ),
            Flexible(
              child: Text(
                StringsConfig.youtube,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context)
                    .textTheme
                    .bodyText1!
                    .copyWith(fontSize: 14),
              ),
            ),
          ],
        ),
      ),
      actions: [
        iconButtonAppBarCustom(
          icon: Icons.cast,
          onClick: () {},
        ),
        iconButtonAppBarCustom(
          icon: Icons.notifications_outlined,
          onClick: () {},
        ),
        iconButtonAppBarCustom(
          icon: Icons.search,
          onClick: () {},
        ),
        IconButton(
          onPressed: () {},
          iconSize: 40,
          icon: const CircleAvatar(
            foregroundImage: AssetImage("assets/images/profile.jpg"),
          ),
        ),
      ],
    );
  }

  Widget iconButtonAppBarCustom({
    required void Function() onClick,
    required IconData icon,
  }) {
    return IconButton(
      onPressed: onClick,
      icon: Icon(icon),
    );
  }
}
