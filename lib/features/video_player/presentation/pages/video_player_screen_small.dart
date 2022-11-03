// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:video_player/video_player.dart';

import 'package:youtube_clone/core/components/button_subscribe.dart';
import 'package:youtube_clone/core/components/loading_custom.dart';
import 'package:youtube_clone/features/home/presentation/blocs/home_video_player_bloc/home_video_player_bloc.dart';
import 'package:youtube_clone/features/home/presentation/pages/widgets/home_grid_view_custom.dart';
import 'package:youtube_clone/features/video_player/presentation/blocs/subscriber_bloc/subscriber_bloc.dart';
import 'package:youtube_clone/features/video_player/presentation/blocs/subscriber_bloc/subscriber_event.dart';
import 'package:youtube_clone/features/video_player/presentation/pages/widgets/video_action.dart';
import 'package:youtube_clone/features/video_player/presentation/pages/widgets/video_comments.dart';
import 'package:youtube_clone/features/video_player/presentation/pages/widgets/video_info_mobile.dart';

import '../../../../core/components/error/error_screen.dart';
import '../../../../core/utils/config/assets_config.dart';
import '../../../../core/utils/config/strings_config.dart';
import '../../../../getit_injection.dart';
import '../../../home/presentation/blocs/home_bloc/home_bloc.dart';
import '../../../home/presentation/blocs/home_video_player_bloc/home_video_player_event.dart';
import '../../../profile/presentation/blocs/profile_bloc/profile_bloc.dart';
import '../../../profile/presentation/blocs/profile_bloc/profile_event.dart';
import '../../data/model/video_player_model.dart';
import '../../domain/repository/video_player_repository.dart';
import '../blocs/likes_and_deslikes_bloc/likes_and_deslikes_bloc.dart';
import '../blocs/video_bloc/video_bloc.dart';
import '../blocs/video_bloc/video_state.dart';
import '../blocs/video_player_bloc/video_player_bloc.dart';
import '../blocs/video_player_bloc/video_player_state.dart';

class VideoPlayerScreenSmall extends StatelessWidget {
  const VideoPlayerScreenSmall({
    Key? key,
    required this.height,
  }) : super(key: key);

  final double height;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<VideoBloc, VideoState>(
        builder: (context, state) {
          if (state is VideoLoadingState) {
            return const LoadingCustom();
          } else if (state is VideoSuccessState) {
            return VideoPlayerMobileCustom(
              video: state.data.result,
              height: height,
            );
          } else if (state is VideoErrorState) {
            if (state.error.contains("Page not found")) {
              return const ErrorScreen(
                title: StringsConfig.notFound,
                description: StringsConfig.notFoundDesc,
                pathImage: AssetsConfig.no_result,
              );
            } else if (state.error.contains("You are not authenticate")) {
              return ErrorScreen(
                title: state.error,
                description: StringsConfig.notAuthDesc,
                isButtonLogin: true,
              );
            } else {
              return ErrorScreen(
                title: state.error,
                description: "",
              );
            }
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}

class VideoPlayerMobileCustom extends StatelessWidget {
  const VideoPlayerMobileCustom({
    Key? key,
    required this.video,
    required this.height,
  }) : super(key: key);

  final VideoPlayerDataModel video;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          alignment: Alignment.topLeft,
          children: [
            SizedBox(
              height: height * 0.35,
              width: MediaQuery.of(context).size.width,
              child: BlocBuilder<VideoPlayerBloc, VideoPlayerState>(
                builder: (context, state) {
                  return state.chewieController != null
                      ? Chewie(
                          controller: state.chewieController!,
                        )
                      : const SizedBox.shrink();
                },
              ),
            ),
            IconButton(
              onPressed: () {
                context.read<HomeVideoPlayerBloc>().add(
                      GetHomeVideoPlayerPanelStateMinEvent(),
                    );
              },
              icon: const Icon(
                Icons.keyboard_arrow_down,
              ),
            ),
          ],
        ),
        Expanded(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                VideoInfoMobile(
                  video: video,
                  height: height * 0.5,
                ),
                const Divider(),
                BlocProvider(
                  create: (context) => LikesAndDesLikesBloc(
                    repo: getIt<VideoPlayerRepository>(),
                  ),
                  child: VideoAction(video: video),
                ),
                const Divider(),
                VideoUserInfoAndSubscriber(
                  video: video,
                ),
                const Divider(),
                VideoComments(
                  video: video,
                  height: height * 0.5,
                ),
                const Divider(),
                const HomeGridViewCustom(
                  isMiniPlayerPadding: true,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class VideoUserInfoAndSubscriber extends StatefulWidget {
  const VideoUserInfoAndSubscriber({
    Key? key,
    required this.video,
  }) : super(key: key);

  final VideoPlayerDataModel video;

  @override
  State<VideoUserInfoAndSubscriber> createState() =>
      _VideoUserInfoAndSubscriberState();
}

class _VideoUserInfoAndSubscriberState
    extends State<VideoUserInfoAndSubscriber> {
  @override
  void initState() {
    context
        .read<SubscriberBloc>()
        .add(GetStatusSubscriberEvent(userID: widget.video.user.id));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.read<HomeVideoPlayerBloc>().add(
              GetHomeVideoPlayerPanelStateMinEvent(),
            );
        context.read<HomeVideoPlayerBloc>().add(
              HomeVideoPlayerEventShowProfile(
                showProfile: false,
              ),
            );

        context
            .read<ProfileBloc>()
            .add(GetProfileEvent(userID: widget.video.user.id));
      },
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          children: [
            const CircleAvatar(
              foregroundImage: AssetImage("assets/images/profile.jpg"),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.video.user.fullname,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context)
                          .textTheme
                          .bodyText2!
                          .copyWith(fontSize: 15),
                    ),
                    Text(
                      "54 Subscriber",
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context)
                          .textTheme
                          .caption!
                          .copyWith(fontSize: 14),
                    ),
                  ],
                ),
              ),
            ),
            ButtonSubscribe(
              fullname: widget.video.user.fullname,
              userID: widget.video.user.id,
            ),
          ],
        ),
      ),
    );
  }
}
