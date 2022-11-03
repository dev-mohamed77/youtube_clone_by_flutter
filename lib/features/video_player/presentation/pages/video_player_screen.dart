// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:youtube_clone/core/components/responsive.dart';
import 'package:youtube_clone/core/utils/manager/app_navigator_manager.dart';
import 'package:youtube_clone/features/video_player/presentation/pages/video_player_screen_large.dart';
import 'package:youtube_clone/features/video_player/presentation/pages/video_player_screen_small.dart';

class VideoPlayerScreen extends StatelessWidget {
  const VideoPlayerScreen({
    Key? key,
    this.height,
  }) : super(key: key);

  static const String id = "/VideoDetailsScreen";

  static route() => AppNavigatorManager.navigatorMaterialPush(
        id,
        const VideoPlayerScreen(),
      );
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Responsive(
      mobile: VideoPlayerScreenSmall(
        height: height ?? 0,
      ),
      desktop: const VideoPlayerScreenLarge(),
    );
  }
}
