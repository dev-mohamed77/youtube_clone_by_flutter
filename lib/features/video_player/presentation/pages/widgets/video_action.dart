// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:youtube_clone/core/utils/manager/app_color_manager.dart';
import 'package:youtube_clone/features/video_player/presentation/blocs/likes_and_deslikes_bloc/likes_and_deslikes_event.dart';

import '../../../data/model/video_player_model.dart';
import '../../blocs/likes_and_deslikes_bloc/likes_and_deslikes_bloc.dart';
import '../../blocs/likes_and_deslikes_bloc/likes_and_deslikes_state.dart';

class VideoAction extends StatelessWidget {
  const VideoAction({
    Key? key,
    required this.video,
  }) : super(key: key);

  final VideoPlayerDataModel video;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: MediaQuery.of(context).size.width,
        height: 60,
        child: BlocBuilder<LikesAndDesLikesBloc, LikesAndDesLikesState>(
          builder: (context, state) {
            return ListView(
              scrollDirection: Axis.horizontal,
              children: [
                _iconButtonAction(
                  context,
                  onClick: () {
                    context.read<LikesAndDesLikesBloc>().add(
                          AddLikeAndDeleteForVideoEvent(
                            videoID: video.id,
                          ),
                        );
                  },
                  icon: Icons.thumb_up_sharp,
                  text: "Like",
                  color: state is LikesAndDesLikesNullState
                      ? video.likeStatus
                          ? AppColorManager.red
                          : AppColorManager.greyColor
                      : state is LikesAndDesLikesSuccessState
                          ? state.data.result.like
                              ? AppColorManager.red
                              : AppColorManager.greyColor
                          : AppColorManager.greyColor,
                ),
                _iconButtonAction(
                  context,
                  onClick: () {
                    context.read<LikesAndDesLikesBloc>().add(
                          AddDesLikeAndDeleteForVideoEvent(
                            videoID: video.id,
                          ),
                        );
                  },
                  icon: Icons.thumb_down_sharp,
                  text: "Dislike",
                  color: state is LikesAndDesLikesNullState
                      ? video.desLikeStatus
                          ? AppColorManager.red
                          : AppColorManager.greyColor
                      : state is LikesAndDesLikesSuccessState
                          ? state.data.result.desLike
                              ? AppColorManager.red
                              : AppColorManager.greyColor
                          : AppColorManager.greyColor,
                ),
                _iconButtonAction(
                  context,
                  onClick: () {},
                  icon: Icons.share,
                  text: "Share",
                  color: AppColorManager.greyColor,
                ),
                _iconButtonAction(
                  context,
                  onClick: () {},
                  icon: Icons.download,
                  text: "Download",
                  color: AppColorManager.greyColor,
                ),
              ],
            );
          },
        ));
  }

  Widget _iconButtonAction(
    BuildContext context, {
    required VoidCallback onClick,
    required IconData icon,
    required String text,
    required Color color,
  }) {
    return InkWell(
      onTap: onClick,
      borderRadius: BorderRadius.circular(20),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: color,
            ),
            Text(
              text,
              style: Theme.of(context)
                  .textTheme
                  .titleSmall!
                  .copyWith(color: color),
            )
          ],
        ),
      ),
    );
  }
}
