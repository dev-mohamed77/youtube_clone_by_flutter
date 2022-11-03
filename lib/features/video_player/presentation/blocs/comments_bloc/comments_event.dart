// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

import '../../../data/model/comments_model.dart';

abstract class CommentsEvents extends Equatable {}

class GetCommentsEvent extends CommentsEvents {
  final String videoID;

  final String pages;
  final String limit;

  GetCommentsEvent({
    required this.videoID,
    required this.pages,
    required this.limit,
  });
  @override
  List<Object?> get props => [videoID];
}

class AddCommentEvent extends CommentsEvents {
  final String videoID;
  final String title;
  AddCommentEvent({
    required this.videoID,
    required this.title,
  });

  @override
  List<Object?> get props => [videoID, title];
}

class GetCommentByIDEvent extends CommentsEvents {
  final String commentID;
  GetCommentByIDEvent({
    required this.commentID,
  });

  @override
  List<Object?> get props => [commentID];
}

class UpdateCommentByIDEvent extends CommentsEvents {
  final CommentModel comment;
  UpdateCommentByIDEvent({
    required this.comment,
  });

  @override
  List<Object?> get props => [comment];
}

class DeleteCommentByIDEvent extends CommentsEvents {
  final String commentID;
  DeleteCommentByIDEvent({
    required this.commentID,
  });

  @override
  List<Object?> get props => [commentID];
}
