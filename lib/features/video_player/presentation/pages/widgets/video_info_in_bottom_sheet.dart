import 'package:flutter/material.dart';

import '../../../data/model/video_player_model.dart';

class VideoInformationInBottomSheet extends StatelessWidget {
  const VideoInformationInBottomSheet({
    Key? key,
    required this.video,
  }) : super(key: key);

  final VideoPlayerDataModel video;

  @override
  Widget build(BuildContext context) {
    DateTime date = DateTime.parse(video.createdAt);
    int day = date.day;
    int month = date.month;
    int year = date.year;
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              video.title,
              style: Theme.of(context).textTheme.bodyText1,
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                const CircleAvatar(
                  maxRadius: 16,
                  foregroundImage: AssetImage(
                    "assets/images/profile.jpg",
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                Flexible(
                  child: Text(
                    video.user.fullname,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _videoReactInfo(
                  context,
                  video.likes,
                  "number of fans",
                ),
                _videoReactInfo(
                  context,
                  video.views.toString(),
                  "number of views",
                ),
                _videoReactInfo(
                  context,
                  "$year",
                  "$month $day",
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            const Divider(
              height: 2,
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              video.description,
              style: Theme.of(context).textTheme.bodyText2,
            )
          ],
        ),
      ),
    );
  }

  Widget _videoReactInfo(
    BuildContext context,
    String title,
    String desc,
  ) {
    return Flexible(
      child: Column(
        children: [
          Text(
            title,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.bodyText1,
          ),
          Text(
            desc,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.caption,
          ),
        ],
      ),
    );
  }
}
