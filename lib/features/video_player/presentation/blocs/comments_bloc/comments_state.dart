// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

import 'package:youtube_clone/features/video_player/data/model/comments_model.dart';

abstract class CommentsState extends Equatable {}

class GetCommentsLoadingState extends CommentsState {
  @override
  List<Object?> get props => [];
}

class GetCommentsSuccessState extends CommentsState {
  final List<CommentModel> comments;
  GetCommentsSuccessState({
    required this.comments,
  });
  @override
  List<Object?> get props => [comments];
}

class GetCommentsErrorState extends CommentsState {
  final String error;
  GetCommentsErrorState({
    required this.error,
  });
  @override
  List<Object?> get props => [error];
}
