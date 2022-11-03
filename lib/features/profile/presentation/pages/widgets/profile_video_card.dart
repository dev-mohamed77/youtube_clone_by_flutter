import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timeago/timeago.dart' as timeago;

import '../../../../../core/components/responsive.dart';
import '../../../../../core/utils/manager/app_color_manager.dart';
import '../../../../../getit_injection.dart';
import '../../../../home/domain/repository/home_repository.dart';
import '../../../../home/presentation/blocs/home_bloc/home_bloc.dart';
import '../../../../home/presentation/blocs/home_bloc/home_event.dart';
import '../../../../home/presentation/blocs/home_video_player_bloc/home_video_player_bloc.dart';
import '../../../../home/presentation/blocs/home_video_player_bloc/home_video_player_event.dart';
import '../../../../video_player/domain/repository/video_player_repository.dart';
import '../../../../video_player/presentation/blocs/video_bloc/video_bloc.dart';
import '../../../../video_player/presentation/blocs/video_bloc/video_event.dart';
import '../../../../video_player/presentation/blocs/video_player_bloc/video_player_bloc.dart';
import '../../../../video_player/presentation/blocs/video_player_bloc/video_player_event.dart';
import '../../../../video_player/presentation/pages/video_player_screen.dart';
import '../../../data/model/profile_model.dart';

class ProfileVideoCard extends StatelessWidget {
  const ProfileVideoCard({
    Key? key,
    required this.video,
    required this.imageWidth,
  }) : super(key: key);

  final ProfileVideos video;
  final double imageWidth;

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
                videoId: video.videosID,
              ));
          context
              .read<VideoPlayerBloc>()
              .add(VideoPlayerEvent(videoUrl: video.url));
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
                          videoId: video.videosID,
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
          ? Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: 150,
                height: 100,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      "assets/images/profile.jpg",
                      width: 150,
                      height: 100,
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
                            video.title,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                          const SizedBox(
                            height: 7,
                          ),
                          _captionText(
                            context,
                            "${video.views} Views . ${timeago.format(DateTime.parse(video.createdAt))}",
                            1,
                          ),
                          const SizedBox(
                            height: 7,
                          ),
                          _captionText(
                            context,
                            video.description,
                            3,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  alignment: Alignment.bottomLeft,
                  children: [
                    Image.asset(
                      "assets/images/profile.jpg",
                      fit: BoxFit.fill,
                      height: 150,
                      width: imageWidth,
                    ),
                    Container(
                      width: 50,
                      height: 15,
                      color: AppColorManager.blackColor,
                      child: Text(
                        video.duration,
                        style: Theme.of(context).textTheme.titleSmall!.copyWith(
                              color: AppColorManager.whiteColor,
                            ),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  video.title,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  "${video.views} views . ${timeago.format(DateTime.parse(video.createdAt))}",
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: Theme.of(context)
                      .textTheme
                      .caption!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
              ],
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
