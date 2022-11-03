// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

abstract class VideoEvent extends Equatable {}

class VideoGetVideoEvent extends VideoEvent {
  final String videoId;
  VideoGetVideoEvent({
    required this.videoId,
  });
  @override
  List<Object?> get props => [
        videoId,
      ];
}

class VideoAddViewEvent extends VideoEvent {
  final String videoId;
  VideoAddViewEvent({
    required this.videoId,
  });
  @override
  List<Object?> get props => [videoId];
}

class VideoGetStatusSubscriberSuccessEvent extends VideoEvent {
  @override
  List<Object?> get props => [];
}
