import 'package:chewie/chewie.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:video_player/video_player.dart';
import 'package:youtube_clone/features/video_player/presentation/blocs/video_player_bloc/video_player_event.dart';
import 'package:youtube_clone/features/video_player/presentation/blocs/video_player_bloc/video_player_state.dart';

class VideoPlayerBloc extends Bloc<VideoPlayerEvent, VideoPlayerState> {
  late VideoPlayerController videoPlayerController;
  late ChewieController chewieController;

  VideoPlayerBloc() : super(VideoPlayerState()) {
    on<VideoPlayerEvent>((event, emit) {
      videoPlayerController = VideoPlayerController.network(event.videoUrl);
      emit(
        VideoPlayerState(
          chewieController:
              ChewieController(videoPlayerController: videoPlayerController),
        ),
      );
    });
  }
}
