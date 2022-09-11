import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:youtube_clone/core/components/responsive.dart';
import 'package:youtube_clone/features/home/presentation/blocs/home_bloc/home_bloc.dart';
import 'package:youtube_clone/features/home/presentation/blocs/home_bloc/home_event.dart';
import 'package:youtube_clone/features/home/presentation/blocs/home_video_player_bloc/home_video_player_bloc.dart';
import 'package:youtube_clone/features/home/presentation/pages/home_screen_large.dart';
import 'package:youtube_clone/features/home/presentation/pages/home_screen_small.dart';
import 'package:youtube_clone/features/video_player/presentation/blocs/video_player_bloc/video_player_bloc.dart';
import 'package:youtube_clone/getit_injection.dart';
import '../../../../core/utils/manager/app_navigator_manager.dart';
import '../../../video_player/domain/repository/video_player_repository.dart';
import '../../../video_player/presentation/pages/video_player_screen.dart';
import '../../domain/repository/home_repository.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  static const String id = "/HomeScreen";

  static Route route() => AppNavigatorManager.navigatorMaterialPush(
        id,
        MultiBlocProvider(
          providers: [
            BlocProvider<HomeBloc>(
              create: (context) => HomeBloc(repo: getIt<HomeRepository>())
                ..add(
                  HomeEventGetVideosRandom(limit: 40, page: 1),
                ),
            ),
            BlocProvider<HomeVideoPlayerBloc>(
              create: (context) => HomeVideoPlayerBloc(
                videoPlayerBloc: VideoPlayerBloc(
                  repo: getIt<VideoPlayerRepository>(),
                ),
              ),
            ),
            BlocProvider(
              create: (context) =>
                  VideoPlayerBloc(repo: getIt<VideoPlayerRepository>()),
            ),
          ],
          child: const HomeScreen(),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Responsive(
        mobile: HomeScreenSmall(),
        desktop: HomeScreenLarge(),
      ),
    );
  }
}
