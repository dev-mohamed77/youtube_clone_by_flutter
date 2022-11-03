// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:youtube_clone/core/services/network_services/error_handle.dart';
import 'package:youtube_clone/features/video_player/domain/repository/video_player_repository.dart';
import 'package:youtube_clone/features/video_player/presentation/blocs/video_bloc/video_event.dart';
import 'package:youtube_clone/features/video_player/presentation/blocs/video_bloc/video_state.dart';

class VideoBloc extends Bloc<VideoEvent, VideoState> {
  final VideoPlayerRepository repo;

  VideoBloc({
    required this.repo,
  }) : super(VideoLoadingState()) {
    on<VideoGetVideoEvent>((event, emit) async {
      emit(VideoLoadingState());

      final result = await repo.getVideo(event.videoId);

      result.when(success: (data) {
        emit(VideoSuccessState(data: data));
      }, failure: (err) {
        emit(
          VideoErrorState(error: ErrorHandle.getErrorMessage(err)),
        );
      });
    });

    on<VideoAddViewEvent>((event, emit) async {
      final result = await repo.addView(event.videoId);
      result.when(success: (data) {
        emit(VideoAddViewSuccessState(data: data));
      }, failure: (err) {
        emit(
          VideoAddViewErrorState(error: ErrorHandle.getErrorMessage(err)),
        );
      });
    });
  }
}
