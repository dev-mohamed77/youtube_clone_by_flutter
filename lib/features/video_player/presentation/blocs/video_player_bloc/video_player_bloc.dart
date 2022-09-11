// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:youtube_clone/core/services/network_services/error_handle.dart';

import 'package:youtube_clone/features/video_player/domain/repository/video_player_repository.dart';
import 'package:youtube_clone/features/video_player/presentation/blocs/video_player_bloc/video_player_event.dart';
import 'package:youtube_clone/features/video_player/presentation/blocs/video_player_bloc/video_player_state.dart';

class VideoPlayerBloc extends Bloc<VideoPlayerEvent, VideoPlayerState> {
  final VideoPlayerRepository repo;

  VideoPlayerBloc({
    required this.repo,
  }) : super(VideoPlayerLoadingState()) {
    on<VideoPlayerGetVideoEvent>((event, emit) async {
      emit(VideoPlayerLoadingState());
      final result = await repo.getVideo(event.videoId);
      result.when(success: (data) {
        emit(VideoPlayerSuccessState(data: data));
      }, failure: (err) {
        emit(
          VideoPlayerErrorState(error: ErrorHandle.getErrorMessage(err)),
        );
      });
    });

    on<VideoPlayerAddViewEvent>((event, emit) async {
      final result = await repo.addView(event.videoId);
      result.when(success: (data) {
        emit(VideoPlayerAddViewSuccessState(data: data));
      }, failure: (err) {
        emit(
          VideoPlayerAddViewErrorState(error: ErrorHandle.getErrorMessage(err)),
        );
      });
    });

    on<VideoPlayerGetStatusSubscriberSuccessEvent>((event, emit) async {
      final result = await repo.getStatusSubscriberChannel();
      result.when(success: (data) {
        emit(VideoPlayerGetStatusSubscriberSuccessState(data: data));
      }, failure: (err) {
        emit(
          VideoPlayerGetStatusSubscriberErrorState(
              error: ErrorHandle.getErrorMessage(err)),
        );
      });
    });
  }
}
