// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:youtube_clone/core/components/responsive.dart';
import 'package:youtube_clone/features/home/data/model/videos_model.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:youtube_clone/features/home/presentation/blocs/home_video_player_bloc/home_video_player_bloc.dart';
import 'package:youtube_clone/features/profile/presentation/blocs/profile_bloc/profile_event.dart';
import 'package:youtube_clone/features/profile/presentation/pages/profile_screen.dart';
import 'package:youtube_clone/features/video_player/presentation/blocs/subscriber_bloc/subscriber_bloc.dart';
import 'package:youtube_clone/features/video_player/presentation/blocs/video_player_bloc/video_player_bloc.dart';
import 'package:youtube_clone/features/video_player/presentation/blocs/video_player_bloc/video_player_event.dart';
import 'package:youtube_clone/features/video_player/presentation/pages/video_player_screen.dart';
import 'package:youtube_clone/getit_injection.dart';

import '../../features/home/presentation/blocs/home_bloc/home_event.dart';
import '../../features/profile/presentation/blocs/profile_bloc/profile_bloc.dart';
import '../../features/video_player/presentation/blocs/subscriber_bloc/subscriber_event.dart';
import '../../features/video_player/presentation/blocs/video_bloc/video_event.dart';
import '../utils/config/assets_config.dart';
import '../../features/video_player/domain/repository/video_player_repository.dart';
import '../../features/video_player/presentation/blocs/video_bloc/video_bloc.dart';
import '../../features/home/domain/repository/home_repository.dart';
import '../../features/home/presentation/blocs/home_bloc/home_bloc.dart';
import '../../features/home/presentation/blocs/home_video_player_bloc/home_video_player_event.dart';

class VideoCard extends StatelessWidget {
  const VideoCard({
    Key? key,
    required this.video,
  }) : super(key: key);

  final VideosDataModel video;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (Responsive.isMobile(context) || Responsive.isTablet(context)) {
          context.read<HomeVideoPlayerBloc>().add(
                GetHomeVideoPlayerShowMiniPlayerWithPanelStateMaxEvent(
                    showMiniPlayer: false
                    // showMiniPlayer: false,
                    ),
              );
          context.read<VideoBloc>().add(VideoGetVideoEvent(
                videoId: video.id,
              ));
          context
              .read<VideoPlayerBloc>()
              .add(VideoPlayerEvent(videoUrl: video.videoUrl));
        } else {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => MultiBlocProvider(
                providers: [
                  BlocProvider(
                    create: (context) => HomeBloc(
                      repo: getIt<HomeRepository>(),
                    )..add(
                        HomeEventGetVideosRandom(
                          limit: 40,
                          page: 1,
                        ),
                      ),
                  ),
                  BlocProvider(
                    create: (context) => VideoBloc(
                      repo: getIt<VideoPlayerRepository>(),
                    )..add(
                        VideoGetVideoEvent(
                          videoId: video.id,
                        ),
                      ),
                  ),
                ],
                child: const VideoPlayerScreen(),
              ),
            ),
          );
        }
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            "assets/images/profile.jpg",
            height: 220,
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.fill,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                    if (Responsive.isMobile(context) ||
                        Responsive.isTablet(context)) {
                      context.read<HomeVideoPlayerBloc>().add(
                            HomeVideoPlayerEventShowProfile(showProfile: false),
                          );
                      context
                          .read<ProfileBloc>()
                          .add(GetProfileEvent(userID: video.user.id));
                      context
                          .read<SubscriberBloc>()
                          .add(GetStatusSubscriberEvent(userID: video.user.id));
                    } else {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => BlocProvider(
                          create: (context) => ProfileBloc(repo: getIt())
                            ..add(GetProfileEvent(userID: video.user.id)),
                          child: const ProfileScreen(),
                        ),
                      ));
                    }
                  },
                  child: const CircleAvatar(
                    foregroundImage: AssetImage(
                      AssetsConfig.youtube_icon,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        child: Text(
                          video.title,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          style:
                              Theme.of(context).textTheme.bodyText1!.copyWith(
                                    fontSize: 14,
                                  ),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      GestureDetector(
                        onTap: () => print(" Navigate to profile"),
                        child: Text(
                          video.user.fullname,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context).textTheme.caption,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        "${timeago.format(DateTime.parse(video.createdAt))} . ${video.view} Views",
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.caption,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
