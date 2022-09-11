// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:youtube_clone/features/home/data/model/get_status_sbscriber.dart';

import 'package:youtube_clone/features/video_player/data/model/message_result_model.dart';
import 'package:youtube_clone/features/video_player/data/model/video_player_model.dart';

abstract class VideoPlayerState extends Equatable {}

class VideoPlayerLoadingState extends VideoPlayerState {
  @override
  List<Object?> get props => [];
}

class VideoPlayerSuccessState extends VideoPlayerState {
  final VideoPlayerModel data;

  VideoPlayerSuccessState({
    required this.data,
  });
  @override
  List<Object?> get props => [data];
}

class VideoPlayerErrorState extends VideoPlayerState {
  final String error;

  VideoPlayerErrorState({
    required this.error,
  });

  @override
  List<Object?> get props => [error];
}

class VideoPlayerAddViewSuccessState extends VideoPlayerState {
  final MessageResultModel data;

  VideoPlayerAddViewSuccessState({
    required this.data,
  });

  @override
  List<Object?> get props => [data];
}

class VideoPlayerAddViewErrorState extends VideoPlayerState {
  final String error;

  VideoPlayerAddViewErrorState({
    required this.error,
  });

  @override
  List<Object?> get props => [error];
}

class VideoPlayerGetStatusSubscriberSuccessState extends VideoPlayerState {
  final GetStatusSubscriber data;

  VideoPlayerGetStatusSubscriberSuccessState({
    required this.data,
  });

  @override
  List<Object?> get props => [data];
}

class VideoPlayerGetStatusSubscriberErrorState extends VideoPlayerState {
  final String error;

  VideoPlayerGetStatusSubscriberErrorState({
    required this.error,
  });

  @override
  List<Object?> get props => [error];
}
