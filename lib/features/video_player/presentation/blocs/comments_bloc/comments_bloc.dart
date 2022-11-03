// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';
import 'package:youtube_clone/core/services/network_services/error_handle.dart';
import 'package:youtube_clone/features/video_player/data/model/comments_model.dart';

import 'package:youtube_clone/features/video_player/domain/repository/video_player_repository.dart';
import 'package:youtube_clone/features/video_player/presentation/blocs/comments_bloc/comments_event.dart';
import 'package:youtube_clone/features/video_player/presentation/blocs/comments_bloc/comments_state.dart';

import '../../../../../getit_injection.dart';
import '../../../../auth/data/datasource/auth_local_database.dart';

class CommentsBloc extends Bloc<CommentsEvents, CommentsState> {
  final VideoPlayerRepository repo;
  CommentsBloc({
    required this.repo,
  }) : super(GetCommentsLoadingState()) {
    on<GetCommentsEvent>((event, emit) async {
      emit(GetCommentsLoadingState());
      final result = await repo.getCommentsByVideo(
        videoID: event.videoID,
        pages: event.pages,
        limit: event.limit,
      );
      result.when(
        success: (data) {
          emit(GetCommentsSuccessState(comments: data));
        },
        failure: (errorHandle) {
          emit(GetCommentsErrorState(
              error: ErrorHandle.getErrorMessage(errorHandle)));
        },
      );
    });

    on<AddCommentEvent>((event, emit) async {
      final commentState = state;
      if (commentState is GetCommentsSuccessState) {
        final currentUser = await getIt<AuthLocalDataSource>().getUser();
        final result = await repo.addComment(event.videoID, event.title);

        result.when(
          success: (data) {
            final comment = CommentModel(
              commentID: data.commentID,
              commentUser: CommentUser(
                userID: data.userID,
                fullname: currentUser["fullname"],
                imageUrl: currentUser["image_url"],
                email: currentUser["email"],
                username: currentUser["username"],
              ),
              title: data.title,
              videoID: data.videoID,
              createdAt: data.createdAt,
              updatedAt: data.updatedAt,
            );

            emit(
              GetCommentsSuccessState(
                  comments: List.from(commentState.comments)..add(comment)),
            );
          },
          failure: (errorHandle) {
            emit(GetCommentsErrorState(
                error: ErrorHandle.getErrorMessage(errorHandle)));
          },
        );
      }
    });

    on<UpdateCommentByIDEvent>((event, emit) async {
      print(event.comment);
      final commentState = state;
      if (commentState is GetCommentsSuccessState) {
        final result = await repo.updateComment(
          event.comment.commentID,
          event.comment.title,
        );
        result.when(
          success: (data) {
            final comments = commentState.comments.map((comment) {
              return comment.commentID == event.comment.commentID
                  ? event.comment
                  : comment;
            }).toList();
            emit(GetCommentsSuccessState(comments: comments));
          },
          failure: (errorHandle) {
            emit(GetCommentsErrorState(
                error: ErrorHandle.getErrorMessage(errorHandle)));
          },
        );
      }
    });

    on<DeleteCommentByIDEvent>((event, emit) async {
      final commentState = state;
      if (commentState is GetCommentsSuccessState) {
        final result = await repo.deleteComment(event.commentID);
        result.when(
          success: (data) {
            final comments = commentState.comments.where((comment) {
              return comment.commentID != event.commentID;
            }).toList();
            emit(GetCommentsSuccessState(comments: comments));
          },
          failure: (errorHandle) {
            emit(GetCommentsErrorState(
                error: ErrorHandle.getErrorMessage(errorHandle)));
          },
        );
      }
    });
  }

  BehaviorSubject<String?> textAddButtonController = BehaviorSubject<String?>();

  Stream get textAddButtonStream => textAddButtonController.stream;

  Sink get textAddButtonSink => textAddButtonController.sink;
}
