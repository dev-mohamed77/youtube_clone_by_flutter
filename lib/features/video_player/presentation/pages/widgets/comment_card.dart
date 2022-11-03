// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:youtube_clone/features/video_player/presentation/pages/widgets/update_comment.dart';

import '../../../../../core/utils/manager/app_color_manager.dart';
import '../../../../../core/utils/manager/app_dialog_manager.dart';
import '../../../../../getit_injection.dart';
import '../../../../auth/data/datasource/auth_local_database.dart';
import '../../../data/model/comments_model.dart';
import '../../blocs/comments_bloc/comments_bloc.dart';
import '../../blocs/comments_bloc/comments_event.dart';
import '../../blocs/comments_bloc/comments_state.dart';

class CommentCard extends StatefulWidget {
  final CommentModel comment;
  const CommentCard({
    Key? key,
    required this.comment,
  }) : super(key: key);

  @override
  State<CommentCard> createState() => _CommentCardState();
}

class _CommentCardState extends State<CommentCard> {
  dynamic currentUser;
  void currentUserCun() async {
    currentUser = await getIt<AuthLocalDataSource>().getUser();
  }

  @override
  void initState() {
    currentUserCun();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CircleAvatar(
              maxRadius: 15,
              foregroundImage: AssetImage(
                "assets/images/profile.jpg",
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 10, bottom: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${widget.comment.commentUser.fullname} . ${timeago.format(DateTime.parse(widget.comment.createdAt!))}",
                      style: Theme.of(context).textTheme.labelMedium,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                    Text(
                      widget.comment.title,
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(fontSize: 15),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 3,
                    ),
                  ],
                ),
              ),
            ),
            IconButton(
              onPressed: () {
                AppDialogManager.showModalBottomSheetApp(
                  context,
                  OptionComment(
                    currentUserID: currentUser["id"],
                    comment: widget.comment,
                  ),
                );
              },
              iconSize: 12,
              constraints: const BoxConstraints(
                maxHeight: 25,
                maxWidth: 25,
              ),
              padding: const EdgeInsets.only(top: 4, right: 10),
              icon: const Icon(Icons.more_vert),
            )
          ],
        ),
      ),
    );
  }
}

class OptionComment extends StatefulWidget {
  final String currentUserID;
  final CommentModel comment;
  const OptionComment({
    super.key,
    required this.currentUserID,
    required this.comment,
  });

  @override
  State<OptionComment> createState() => _OptionCommentState();
}

class _OptionCommentState extends State<OptionComment> {
  final TextEditingController textEditingController = TextEditingController();

  @override
  void initState() {
    textEditingController.text = widget.comment.title;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          height: 5,
          width: 40,
          decoration: const BoxDecoration(
            color: AppColorManager.greyColor,
            borderRadius: BorderRadius.horizontal(
              left: Radius.circular(15),
              right: Radius.circular(15),
            ),
          ),
        ),
        if (widget.currentUserID == widget.comment.commentUser.userID)
          BlocListener<CommentsBloc, CommentsState>(
            listener: (context, state) {
              if (state is GetCommentsSuccessState) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("Delete Successfully"),
                    backgroundColor: Colors.green,
                  ),
                );
              } else if (state is GetCommentsErrorState) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(state.error),
                    backgroundColor: AppColorManager.red,
                  ),
                );
              }
            },
            child: listTileCard(
              context,
              onClick: () {
                AppDialogManager.showAlertDialog(
                  context,
                  "Delete Comment",
                  content: "Delete your comment permanently",
                  button: [
                    {
                      "text": "Cancel",
                      "onClick": () {
                        Navigator.pop(context, false);
                      }
                    },
                    {
                      "text": "Delete",
                      "onClick": () {
                        Navigator.pop(context, true);
                      }
                    },
                  ],
                ).then(
                  (value) {
                    if (value) {
                      context.read<CommentsBloc>().add(
                            DeleteCommentByIDEvent(
                              commentID: widget.comment.commentID,
                            ),
                          );
                      Navigator.pop(context);
                    }
                  },
                );
              },
              icon: Icons.delete,
              title: "Delete",
            ),
          ),
        if (widget.currentUserID == widget.comment.commentUser.userID)
          listTileCard(
            context,
            onClick: () {
              Navigator.pop(context);
              AppDialogManager.showModalBottomSheetApp(
                context,
                UpdateComment(
                  textEditingController: textEditingController,
                  comment: widget.comment,
                ),
              );
            },
            icon: Icons.delete,
            title: "Update",
          ),
        if (widget.currentUserID != widget.comment.commentUser.userID)
          listTileCard(
            context,
            onClick: () {},
            icon: Icons.report_gmailerrorred,
            title: "Report",
          ),
      ],
    );
  }

  ListTile listTileCard(
    BuildContext ctx, {
    required void Function()? onClick,
    required IconData icon,
    required String title,
  }) {
    return ListTile(
      onTap: onClick,
      leading: Icon(icon),
      title: Text(
        title,
        style: Theme.of(ctx).textTheme.titleSmall,
      ),
    );
  }
}
