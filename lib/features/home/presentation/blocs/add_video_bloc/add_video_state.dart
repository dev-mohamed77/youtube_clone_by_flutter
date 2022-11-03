// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:chewie/chewie.dart';
import 'package:equatable/equatable.dart';

class AddVideoState extends Equatable {
  final File? videoFile;
  final ChewieController? chewieController;
  const AddVideoState({
    this.videoFile,
    this.chewieController,
  });
  @override
  List<Object?> get props => [videoFile, chewieController];
}
