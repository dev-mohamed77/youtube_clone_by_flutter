// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:chewie/chewie.dart';
import 'package:equatable/equatable.dart';

class VideoPlayerEvent extends Equatable {
  final String videoUrl;
  VideoPlayerEvent({
    required this.videoUrl,
  });

  @override
  List<Object?> get props => [videoUrl];
}
