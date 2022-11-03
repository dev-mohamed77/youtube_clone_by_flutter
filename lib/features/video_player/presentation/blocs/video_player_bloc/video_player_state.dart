// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:chewie/chewie.dart';
import 'package:equatable/equatable.dart';

class VideoPlayerState extends Equatable {
  final ChewieController? chewieController;
  VideoPlayerState({
    this.chewieController,
  });

  @override
  List<Object?> get props => [chewieController];
}
