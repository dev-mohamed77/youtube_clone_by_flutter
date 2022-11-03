// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:youtube_clone/core/services/network_services/error_handle.dart';

import 'package:youtube_clone/features/video_player/domain/repository/video_player_repository.dart';
import 'package:youtube_clone/features/video_player/presentation/blocs/subscriber_bloc/subscriber_event.dart';
import 'package:youtube_clone/features/video_player/presentation/blocs/subscriber_bloc/subscriber_state.dart';

class SubscriberBloc extends Bloc<SubscriberEvent, SubscriberState> {
  final VideoPlayerRepository repo;
  SubscriberBloc({
    required this.repo,
  }) : super(GetStatusSubscriberLoadingState()) {
    on<GetStatusSubscriberEvent>((event, emit) async {
      emit(GetStatusSubscriberLoadingState());

      final result = await repo.getStatusSubscriberChannel(event.userID);
      result.when(
        success: (data) {
          emit(GetStatusSubscriberSuccessState(result: data));
        },
        failure: (errorHandle) {
          emit(GetStatusSubscriberErrorState(
              error: ErrorHandle.getErrorMessage(errorHandle)));
        },
      );
    });
    on<AddSubscribeEvent>((event, emit) async {
      // emit(GetStatusSubscriberLoadingState());

      final result = await repo.addSubscribe(event.userID);
      result.when(
        success: (data) {
          emit(GetStatusSubscriberSuccessState(result: data));
        },
        failure: (errorHandle) {
          emit(GetStatusSubscriberErrorState(
              error: ErrorHandle.getErrorMessage(errorHandle)));
        },
      );
    });
    on<UnSubscribeEvent>((event, emit) async {
      // emit(GetStatusSubscriberLoadingState());

      final result = await repo.unSubscribe(event.userID);
      result.when(
        success: (data) {
          emit(GetStatusSubscriberSuccessState(result: data));
        },
        failure: (errorHandle) {
          emit(GetStatusSubscriberErrorState(
              error: ErrorHandle.getErrorMessage(errorHandle)));
        },
      );
    });
  }
}
