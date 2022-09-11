// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

abstract class VideoPlayerEvent extends Equatable {}

class VideoPlayerGetVideoEvent extends VideoPlayerEvent {
  final String videoId;
  VideoPlayerGetVideoEvent({
    required this.videoId,
  });
  @override
  List<Object?> get props => [videoId];
}

class VideoPlayerAddViewEvent extends VideoPlayerEvent {
  final String videoId;
  VideoPlayerAddViewEvent({
    required this.videoId,
  });
  @override
  List<Object?> get props => [videoId];
}

class VideoPlayerGetStatusSubscriberSuccessEvent extends VideoPlayerEvent {
  @override
  List<Object?> get props => [];
}
