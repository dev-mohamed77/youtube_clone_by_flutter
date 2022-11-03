import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/manager/app_color_manager.dart';
import '../../../../../core/utils/manager/app_dialog_manager.dart';
import '../../../../../getit_injection.dart';
import '../../../../auth/data/datasource/auth_local_database.dart';
import '../../../data/model/comments_model.dart';
import '../../../data/model/video_player_model.dart';
import '../../blocs/comments_bloc/comments_bloc.dart';
import '../../blocs/comments_bloc/comments_event.dart';
import '../../blocs/comments_bloc/comments_state.dart';

class AddComment extends StatelessWidget {
  const AddComment({
    Key? key,
    required this.video,
  }) : super(key: key);

  final VideoPlayerDataModel video;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        AppDialogManager.showModalBottomSheetApp(
          context,
          AddCommentCustom(video: video),
        );
      },
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const CircleAvatar(
                maxRadius: 20,
                foregroundImage: AssetImage(
                  "assets/images/profile.jpg",
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 10,
                ),
                child: Text(
                  "Add a comment ...",
                  style: Theme.of(context).textTheme.titleMedium,
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
          const Divider()
        ],
      ),
    );
  }
}

class AddCommentCustom extends StatefulWidget {
  final VideoPlayerDataModel video;
  const AddCommentCustom({
    Key? key,
    required this.video,
  }) : super(key: key);

  @override
  State<AddCommentCustom> createState() => _AddCommentCustomState();
}

class _AddCommentCustomState extends State<AddCommentCustom> {
  late final TextEditingController textEditingController;

  @override
  void initState() {
    textEditingController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<CommentsBloc, CommentsState>(
      listener: (context, state) {
        if (state is GetCommentsSuccessState) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("Add Successfully"),
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
                onChanged: (String value) {
                  if (value.isNotEmpty) {
                    BlocProvider.of<CommentsBloc>(context)
                        .textAddButtonSink
                        .add(value);
                  } else {
                    BlocProvider.of<CommentsBloc>(context)
                        .textAddButtonSink
                        .add(null);
                  }
                },
              ),
            ),
          ),
          StreamBuilder(
              stream:
                  BlocProvider.of<CommentsBloc>(context).textAddButtonStream,
              builder: ((context, snapshot) {
                if (snapshot.hasData) {
                  return IconButton(
                    onPressed: () async {
                      context.read<CommentsBloc>().add(AddCommentEvent(
                            title: textEditingController.text,
                            videoID: widget.video.id,
                          ));

                      BlocProvider.of<CommentsBloc>(context)
                          .textAddButtonSink
                          .add(null);
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.send,
                      color: AppColorManager.blueColor,
                    ),
                  );
                }
                return const SizedBox.shrink();
              }))
        ],
      ),
    );
  }
}
