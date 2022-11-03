import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/manager/app_color_manager.dart';
import '../../../data/model/comments_model.dart';
import '../../blocs/comments_bloc/comments_bloc.dart';
import '../../blocs/comments_bloc/comments_event.dart';
import '../../blocs/comments_bloc/comments_state.dart';

class UpdateComment extends StatelessWidget {
  const UpdateComment({
    Key? key,
    required this.textEditingController,
    required this.comment,
  }) : super(key: key);

  final TextEditingController textEditingController;
  final CommentModel comment;

  @override
  Widget build(BuildContext context) {
    return BlocListener<CommentsBloc, CommentsState>(
      listener: (context, state) {
        if (state is GetCommentsSuccessState) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("Update Successfully"),
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
      child: Row(
        children: [
          const CircleAvatar(
            maxRadius: 20,
            foregroundImage: AssetImage("assets/images/profile.jpg"),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 12),
              child: TextFormField(
                maxLines: 5,
                minLines: 1,
                controller: textEditingController,
              ),
            ),
          ),
          IconButton(
            onPressed: () {
              print(comment);
              final updateComment = comment.copyWith(
                title: textEditingController.text,
                updatedAt: DateTime.now().toString(),
              );
              context.read<CommentsBloc>().add(
                    UpdateCommentByIDEvent(
                      comment: updateComment,
                    ),
                  );
              BlocProvider.of<CommentsBloc>(context)
                  .textAddButtonSink
                  .add(null);
              Navigator.of(context, rootNavigator: true).pop();
            },
            icon: const Icon(
              Icons.send,
              color: AppColorManager.blueColor,
            ),
          ),
        ],
      ),
    );
  }
}
