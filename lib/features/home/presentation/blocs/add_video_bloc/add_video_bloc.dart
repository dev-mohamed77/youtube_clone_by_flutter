import 'dart:io';

import 'package:chewie/chewie.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_player/video_player.dart';

import 'add_video_event.dart';
import 'add_video_state.dart';

class AddVideoBloc extends Bloc<AddVideoEvent, AddVideoState> {
  AddVideoBloc() : super(const AddVideoState()) {
    on<AddVideoEvent>((event, emit) async {
      final videoPicker =
          await ImagePicker().pickVideo(source: ImageSource.gallery);
      if (videoPicker != null) {
        final videoController =
            VideoPlayerController.file(File(videoPicker.path));
        final chewie = ChewieController(
          videoPlayerController: videoController,
          autoPlay: true,
        );
        emit(
          AddVideoState(
            videoFile: File(videoPicker.path),
            chewieController: chewie,
          ),
        );
      } else {
        emit(const AddVideoState());
      }
    });
  }
}
