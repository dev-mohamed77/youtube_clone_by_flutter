// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:miniplayer/miniplayer.dart';
import 'package:youtube_clone/core/components/responsive.dart';
import 'package:youtube_clone/features/home/data/model/videos_model.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:youtube_clone/features/home/presentation/blocs/home_video_player_bloc/home_video_player_bloc.dart';

import '../../../../../core/utils/config/assets_config.dart';
import '../../../../../getit_injection.dart';
import '../../../../video_player/domain/repository/video_player_repository.dart';
import '../../../../video_player/presentation/blocs/video_player_bloc/video_player_bloc.dart';
import '../../../../video_player/presentation/pages/video_player_screen.dart';
import '../../blocs/home_video_player_bloc/home_video_player_event.dart';

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
        context.read<HomeVideoPlayerBloc>().add(
              GetHomeVideoPlayerEvent(
                miniplayerController: MiniplayerController(),
                showMiniPlayer: false,
              ),
            );

        // Navigator.of(context).push(
        //   MaterialPageRoute(
        //     builder: (_) => BlocProvider(
        //       create: (context) =>
        //           VideoPlayerBloc(repo: getIt<VideoPlayerRepository>()),
        //       child: VideoPlayerScreen(
        //         videoID: video.id,
        //         videoUrl: video.videoUrl,
        //       ),
        //     ),
        //   ),
        // );
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image(
            image: NetworkImage(
              video.videoImage,
            ),
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
                  onTap: () => print(" Navigate to profile"),
                  child: Container(
                    width: 30,
                    height: 30,
                    margin: const EdgeInsets.only(left: 15, right: 15),
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: video.user.image == ""
                        ? Image.asset(
                            AssetsConfig.youtube_icon,
                            fit: BoxFit.cover,
                          )
                        : Image.network(
                            video.user.image,
                            fit: BoxFit.cover,
                          ),
                  ),
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
                      Text(
                        video.user.fullname,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.caption,
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
          )
        ],
      ),
    );
  }
}
