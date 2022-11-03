import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:youtube_clone/core/services/network_services/error_handle.dart';
import 'package:youtube_clone/features/video_player/presentation/blocs/likes_and_deslikes_bloc/likes_and_deslikes_event.dart';
import 'package:youtube_clone/features/video_player/presentation/blocs/likes_and_deslikes_bloc/likes_and_deslikes_state.dart';

import '../../../domain/repository/video_player_repository.dart';

class LikesAndDesLikesBloc
    extends Bloc<LikesAndDesLikesEvent, LikesAndDesLikesState> {
  final VideoPlayerRepository repo;
  LikesAndDesLikesBloc({required this.repo})
      : super(LikesAndDesLikesNullState()) {
    on<AddLikeAndDeleteForVideoEvent>((event, emit) async {
      final result = await repo.addLikeAndDeleteForVideo(event.videoID);
      result.when(
        success: (data) {
          emit(LikesAndDesLikesSuccessState(data: data));
        },
        failure: (errorHandle) {
          emit(LikesAndDesLikesErrorState(
              err: ErrorHandle.getErrorMessage(errorHandle)));
        },
      );
    });
    on<AddDesLikeAndDeleteForVideoEvent>((event, emit) async {
      final result = await repo.addDesLikeAndDeleteForVideo(event.videoID);
      result.when(
        success: (data) {
          emit(LikesAndDesLikesSuccessState(data: data));
        },
        failure: (errorHandle) {
          emit(LikesAndDesLikesErrorState(
              err: ErrorHandle.getErrorMessage(errorHandle)));
        },
      );
    });
  }
}
