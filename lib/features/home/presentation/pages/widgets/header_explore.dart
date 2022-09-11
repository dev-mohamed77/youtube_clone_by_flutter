import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:youtube_clone/features/home/presentation/pages/widgets/header_item.dart';
import 'package:youtube_clone/features/home/presentation/pages/widgets/text_header.dart';

class HeadersExplore extends StatelessWidget {
  const HeadersExplore({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const TextHeader(
          title: "Explore",
        ),
        HeaderItem(
          icon: Icons.headset_rounded,
          title: 'Music',
          onClick: () {},
          isCircular: true,
        ),
        HeaderItem(
          icon: Icons.sports,
          title: 'Sports',
          onClick: () {},
          isCircular: true,
        ),
        HeaderItem(
          icon: FontAwesomeIcons.playstation,
          title: 'Gaming',
          onClick: () {},
          isCircular: true,
        ),
        HeaderItem(
          icon: Icons.live_tv,
          title: 'Live',
          onClick: () {},
          isCircular: true,
        ),
      ],
    );
  }
}
