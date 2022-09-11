import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:youtube_clone/features/home/presentation/pages/widgets/header_item.dart';
import 'package:youtube_clone/features/home/presentation/pages/widgets/text_header.dart';

import '../../../../../core/utils/manager/app_color_manager.dart';

class BottomHeadersItem extends StatelessWidget {
  const BottomHeadersItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const TextHeader(title: "MORE FROM YOUTUBE"),
        HeaderItem(
          title: "Youtube Premium",
          icon: FontAwesomeIcons.youtube,
          iconColor: AppColorManager.red,
          onClick: () {},
        ),
        HeaderItem(
          title: "Youtube Music",
          icon: FontAwesomeIcons.music,
          iconColor: AppColorManager.primaryColor,
          onClick: () {},
          isCircular: true,
          radiusColor: AppColorManager.red,
        ),
        HeaderItem(
          title: "Youtube Kids",
          icon: FontAwesomeIcons.youtube,
          iconColor: AppColorManager.red,
          onClick: () {},
        ),
        HeaderItem(
          title: "Youtube Tv",
          icon: FontAwesomeIcons.tv,
          iconColor: AppColorManager.red,
          onClick: () {},
        ),
      ],
    );
  }
}
