// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../../core/components/bottom_sheet_custom.dart';
import '../../../../../core/utils/manager/app_dialog_manager.dart';
import '../../../data/model/video_player_model.dart';
import '../../blocs/comments_bloc/comments_bloc.dart';
import '../../blocs/comments_bloc/comments_event.dart';
import '../../blocs/comments_bloc/comments_state.dart';
import 'comment_custom.dart';

class VideoComments extends StatefulWidget {
  final VideoPlayerDataModel video;
  const VideoComments({
    Key? key,
    required this.video,
    required this.height,
  }) : super(key: key);
  final double height;

  @override
  State<VideoComments> createState() => _VideoCommentsState();
}

class _VideoCommentsState extends State<VideoComments> {
  @override
  void initState() {
    context.read<CommentsBloc>().add(
          GetCommentsEvent(videoID: widget.video.id, pages: "1", limit: "20"),
        );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CommentsBloc, CommentsState>(
      builder: (context, state) {
        if (state is GetCommentsLoadingState) {
          return Shimmer.fromColors(
            baseColor: Colors.red,
            highlightColor: Colors.yellow,
            child: commentPart(context, 10),
          );
        } else if (state is GetCommentsSuccessState) {
          return InkWell(
            onTap: () {
              AppDialogManager.showBottomSheetApp(
                context,
                BottomSheetCustom(
                  text: "Comments",
                  height: widget.height,
                  child: CommentsCustom(
                    video: widget.video,
                    comments: state.comments,
                  ),
                ),
              );
            },
            child: commentPart(context, state.comments.length + 1),
          );
        } else if (state is GetCommentsErrorState) {
          return Center(
            child: Text(state.error),
          );
        }
        return const SizedBox.shrink();
      },
    );
  }

  Padding commentPart(BuildContext context, int length) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        children: [
          Expanded(
            child: Text(
              "Comments $length",
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.titleSmall,
            ),
          ),
          const Icon(
            Icons.keyboard_double_arrow_down_rounded,
          ),
        ],
      ),
    );
  }
}
