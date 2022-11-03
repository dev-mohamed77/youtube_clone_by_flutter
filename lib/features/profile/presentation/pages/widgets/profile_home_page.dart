import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:youtube_clone/features/profile/presentation/pages/widgets/profile_cover.dart';
import 'package:youtube_clone/features/profile/presentation/pages/widgets/profile_last_ten_videos_n_home_page.dart';

import '../../../../../core/components/button_subscribe.dart';
import '../../../../../core/components/responsive.dart';
import '../../../../../core/utils/config/assets_config.dart';
import '../../../../../getit_injection.dart';
import '../../../../home/domain/repository/home_repository.dart';
import '../../../../home/presentation/blocs/home_bloc/home_bloc.dart';
import '../../../../home/presentation/blocs/home_bloc/home_event.dart';
import '../../../../home/presentation/blocs/home_video_player_bloc/home_video_player_bloc.dart';
import '../../../../home/presentation/blocs/home_video_player_bloc/home_video_player_event.dart';
import '../../../../video_player/domain/repository/video_player_repository.dart';
import '../../../../video_player/presentation/blocs/subscriber_bloc/subscriber_bloc.dart';
import '../../../../video_player/presentation/blocs/subscriber_bloc/subscriber_event.dart';
import '../../../../video_player/presentation/blocs/video_bloc/video_bloc.dart';
import '../../../../video_player/presentation/blocs/video_bloc/video_event.dart';
import '../../../../video_player/presentation/blocs/video_player_bloc/video_player_bloc.dart';
import '../../../../video_player/presentation/blocs/video_player_bloc/video_player_event.dart';
import '../../../../video_player/presentation/pages/video_player_screen.dart';
import '../../../data/model/profile_model.dart';
import '../../blocs/profile_bloc/profile_bloc.dart';
import '../../blocs/profile_bloc/profile_event.dart';
import '../profile_screen.dart';

class ProfileHomePage extends StatelessWidget {
  const ProfileHomePage({
    Key? key,
    required this.profile,
  }) : super(key: key);

  final ProfileModel profile;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const NeverScrollableScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Responsive.isMobile(context) || Responsive.isTablet(context)
              ? Column(
                  children: [
                    ProfileCover(
                        text: profile.result.user.fullname.substring(0, 1)),
                    const SizedBox(
                      height: 10,
                    ),
                    const CircleAvatar(
                      radius: 26,
                      foregroundImage: AssetImage("assets/images/profile.jpg"),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      profile.result.user.fullname,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    ButtonSubscribe(
                      fullname: profile.result.user.fullname,
                      userID: profile.result.user.userID,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      "${profile.result.subscribers.count} Subscriber . ${profile.result.videos.length} Videos",
                      style: Theme.of(context).textTheme.caption,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                )
              : const SizedBox.shrink(),
          videoProfileCard(context),
          const SizedBox(
            height: 10,
          ),
          const Divider(
            thickness: 2,
          ),
          const SizedBox(
            height: 10,
          ),
          Responsive.isDesktop(context)
              ? ProfileLastFiveVideoInHomePage(
                  videos: profile.result.videos,
                )
              : const SizedBox.shrink(),
        ],
      ),
    );
  }

  Widget videoProfileCard(BuildContext context) {
    return InkWell(
      onTap: () {
        if (Responsive.isMobile(context) || Responsive.isTablet(context)) {
          context.read<HomeVideoPlayerBloc>().add(
                GetHomeVideoPlayerShowMiniPlayerWithPanelStateMaxEvent(
                    showMiniPlayer: false
                    // showMiniPlayer: false,
                    ),
              );
          context.read<VideoBloc>().add(
                VideoGetVideoEvent(
                  videoId: profile.result.videos.first.videosID,
                ),
              );
          context.read<VideoPlayerBloc>().add(
                VideoPlayerEvent(videoUrl: profile.result.videos.first.url),
              );
        } else {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => MultiBlocProvider(
                providers: [
                  BlocProvider(
                    create: (context) => VideoBloc(
                      repo: getIt<VideoPlayerRepository>(),
                    )..add(
                        VideoGetVideoEvent(
                          videoId: profile.result.videos.first.videosID,
                        ),
                      ),
                  ),
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
                ],
                child: const VideoPlayerScreen(),
              ),
            ),
          );
        }
      },
      child: Responsive.isMobile(context) || Responsive.isTablet(context)
          ? Column(
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
                                  HomeVideoPlayerEventShowProfile(
                                      showProfile: false),
                                );
                            context.read<ProfileBloc>().add(GetProfileEvent(
                                userID: profile.result.user.userID));
                            context.read<SubscriberBloc>().add(
                                GetStatusSubscriberEvent(
                                    userID: profile.result.user.userID));
                          } else {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => BlocProvider(
                                create: (context) => ProfileBloc(repo: getIt())
                                  ..add(GetProfileEvent(
                                      userID: profile.result.user.userID)),
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
                                profile.result.videos.first.title,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1!
                                    .copyWith(
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
                                profile.result.user.fullname,
                                overflow: TextOverflow.ellipsis,
                                style: Theme.of(context).textTheme.caption,
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              "${timeago.format(DateTime.parse(profile.result.videos.first.createdAt))} . ${profile.result.videos.first.views} Views",
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
            )
          : SizedBox(
              width: 500,
              height: 120,
              child: Row(
                children: [
                  Image.asset(
                    "assets/images/profile.jpg",
                    width: 200,
                    height: double.infinity,
                    fit: BoxFit.fill,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          profile.result.videos.first.title,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          style:
                              Theme.of(context).textTheme.titleMedium!.copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                        const SizedBox(
                          height: 7,
                        ),
                        _captionText(
                          context,
                          "${profile.result.videos.first.views} Views . ${timeago.format(
                            DateTime.parse(
                                profile.result.videos.first.createdAt),
                          )}",
                          1,
                        ),
                        const SizedBox(
                          height: 7,
                        ),
                        _captionText(
                          context,
                          profile.result.videos.first.description,
                          3,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
    );
  }

  Text _captionText(BuildContext context, String text, int maxLines) {
    return Text(
      text,
      overflow: TextOverflow.ellipsis,
      maxLines: maxLines,
      style: Theme.of(context).textTheme.caption!.copyWith(
            fontWeight: FontWeight.bold,
          ),
    );
  }
}
