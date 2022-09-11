// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:video_player/video_player.dart';

import '../blocs/video_player_bloc/video_player_bloc.dart';
import '../blocs/video_player_bloc/video_player_event.dart';

class VideoPlayerScreenSmall extends StatefulWidget {
  const VideoPlayerScreenSmall({
    Key? key,
    required this.videoId,
  }) : super(key: key);

  final String videoId;

  @override
  State<VideoPlayerScreenSmall> createState() => _VideoPlayerScreenSmallState();
}

class _VideoPlayerScreenSmallState extends State<VideoPlayerScreenSmall> {
  late VideoPlayerController videoController;

  @override
  void initState() {
    context.read<VideoPlayerBloc>().add(
          VideoPlayerGetVideoEvent(
            videoId: widget.videoId,
          ),
        );
    // videoController = VideoPlayerController.asset("assets/video_demo.mp4")
    //   ..initialize().then((_) {
    //     setState(() {});
    //     videoController.play();
    //   });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(15),
        child: AspectRatio(
          aspectRatio: 3 / 2,
          child: Container(color: Colors.red),
        ),
      ),
    );
  }
}
