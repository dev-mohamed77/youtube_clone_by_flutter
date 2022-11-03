// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:youtube_clone/core/services/network_services/error_handle.dart';
import 'package:youtube_clone/features/home/domain/repository/home_repository.dart';
import 'package:youtube_clone/features/home/presentation/blocs/home_bloc/home_event.dart';
import 'package:youtube_clone/features/home/presentation/blocs/home_bloc/home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HomeRepository repo;

  HomeBloc({
    required this.repo,
  }) : super(HomeStateGetVideosLoading()) {
    // Get Videos Random
    on<HomeEventGetVideosRandom>((event, emit) async {
      emit(HomeStateGetVideosLoading());

      final result =
          await repo.getVideosRandom(limit: event.limit, page: event.page);
      result.when(success: (data) {
        emit(HomeStateGetVideosSuccess(videos: data));
      }, failure: (err) {
        emit(HomeStateGetVideosError(err: ErrorHandle.getErrorMessage(err)));
      });
    });

    // Get Videos Subscriber
    on<HomeEventGetVideosSub>((event, emit) async {
      emit(HomeStateGetVideosLoading());

      final result = await repo.getVideosSub();
      result.when(success: (data) {
        emit(HomeStateGetVideosSuccess(videos: data));
      }, failure: (err) {
        emit(HomeStateGetVideosError(err: ErrorHandle.getErrorMessage(err)));
      });
    });

    // Get Videos Trend
    on<HomeEventGetVideosTrend>((event, emit) async {
      emit(HomeStateGetVideosLoading());

      final result =
          await repo.getVideosTrend(limit: event.limit, page: event.page);
      result.when(success: (data) {
        emit(HomeStateGetVideosSuccess(videos: data));
      }, failure: (err) {
        emit(HomeStateGetVideosError(err: ErrorHandle.getErrorMessage(err)));
      });
    });

    on<HomeAddVideoEvent>((event, emit) async {
      emit(HomeAddVideoLoading());

      final result = await repo.addVideo(
        description: event.description,
        title: event.title,
        videoFile: event.videoFile,
      );
      result.when(
        success: (data) {
          emit(HomeAddVideoSuccess(message: data));
        },
        failure: (errorHandle) {
          emit(
            HomeAddVideoError(err: ErrorHandle.getErrorMessage(errorHandle)),
          );
        },
      );
    });
  }
}
