// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:youtube_clone/core/utils/manager/app_color_manager.dart';
import 'package:youtube_clone/core/utils/manager/app_dialog_manager.dart';
import 'package:youtube_clone/features/video_player/data/model/comments_model.dart';
import 'package:youtube_clone/features/video_player/presentation/pages/widgets/comment_card.dart';

import '../../../data/model/video_player_model.dart';
import '../../blocs/comments_bloc/comments_bloc.dart';
import '../../blocs/comments_bloc/comments_state.dart';
import 'add_comment_custom.dart';

class CommentsCustom extends StatelessWidget {
  final VideoPlayerDataModel video;
  final List<CommentModel> comments;
  const CommentsCustom({
    Key? key,
    required this.video,
    required this.comments,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CommentsBloc, CommentsState>(
      builder: (context, state) {
        if (state is GetCommentsSuccessState) {
          return listViewComments(state.comments);
        }
        return listViewComments(comments);
      },
    );
  }

  ListView listViewComments(List<CommentModel> comments) {
    return ListView.builder(
        itemCount: comments.length + 1,
        itemBuilder: (context, index) {
          if (index == 0) {
            return AddComment(video: video);
          }
          return CommentCard(
            comment: comments[index - 1],
          );
        });
  }
}
