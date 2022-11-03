// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:youtube_clone/features/video_player/presentation/pages/widgets/video_info.dart';
import 'package:youtube_clone/features/video_player/presentation/pages/widgets/suggested_videos_list.dart';

import '../../../../core/components/appbar_custom.dart';

class VideoPlayerScreenLarge extends StatelessWidget {
  const VideoPlayerScreenLarge({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarCustom(),
      body: SingleChildScrollView(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Expanded(
              flex: 6,
              child: VideoInfo(),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width < 1200 ? 350 : 400,
              child: const SuggestedVideosList(),
            ),
          ],
        ),
      ),
    );
  }
}
