// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:youtube_clone/features/video_player/data/model/result_and_message_model.dart';

import 'package:youtube_clone/features/video_player/data/model/message_model.dart';
import 'package:youtube_clone/features/video_player/data/model/video_player_model.dart';

abstract class VideoState extends Equatable {}

class VideoLoadingState extends VideoState {
  @override
  List<Object?> get props => [];
}

class VideoSuccessState extends VideoState {
  final VideoPlayerModel data;

  VideoSuccessState({
    required this.data,
  });
  @override
  List<Object?> get props => [data];
}

class VideoErrorState extends VideoState {
  final String error;

  VideoErrorState({
    required this.error,
  });

  @override
  List<Object?> get props => [error];
}

class VideoAddViewSuccessState extends VideoState {
  final MessageModel data;

  VideoAddViewSuccessState({
    required this.data,
  });

  @override
  List<Object?> get props => [data];
}

class VideoAddViewErrorState extends VideoState {
  final String error;

  VideoAddViewErrorState({
    required this.error,
  });

  @override
  List<Object?> get props => [error];
}
