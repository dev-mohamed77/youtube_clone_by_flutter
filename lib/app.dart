import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:youtube_clone/core/utils/manager/app_route_manager.dart';
import 'package:youtube_clone/core/utils/manager/app_theme_manager.dart';
import 'package:youtube_clone/features/home/presentation/blocs/add_video_bloc/add_video_bloc.dart';
import 'package:youtube_clone/features/splash/presentation/pages/splash_screen.dart';
import 'package:youtube_clone/features/video_player/presentation/blocs/comments_bloc/comments_bloc.dart';
import 'package:youtube_clone/features/video_player/presentation/blocs/video_player_bloc/video_player_bloc.dart';

import 'features/home/domain/repository/home_repository.dart';
import 'features/home/presentation/blocs/home_bloc/home_bloc.dart';
import 'features/home/presentation/blocs/home_bloc/home_event.dart';
import 'features/home/presentation/blocs/home_video_player_bloc/home_video_player_bloc.dart';
import 'features/profile/domain/repository/profile_repository.dart';
import 'features/profile/presentation/blocs/profile_bloc/profile_bloc.dart';
import 'features/video_player/domain/repository/video_player_repository.dart';
import 'features/video_player/presentation/blocs/subscriber_bloc/subscriber_bloc.dart';
import 'features/video_player/presentation/blocs/video_bloc/video_bloc.dart';
import 'getit_injection.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<HomeBloc>(
          create: (context) => HomeBloc(
            repo: getIt<HomeRepository>(),
          )..add(
              HomeEventGetVideosRandom(limit: 40, page: 1),
            ),
        ),
        BlocProvider<HomeVideoPlayerBloc>(
          create: (context) => HomeVideoPlayerBloc(),
        ),
        BlocProvider(
          create: (context) => VideoBloc(
            repo: getIt<VideoPlayerRepository>(),
          ),
        ),
        BlocProvider(
          create: (context) => VideoPlayerBloc(),
        ),
        BlocProvider(
          create: (context) => ProfileBloc(
            repo: getIt<ProfileRepository>(),
          ),
        ),
        BlocProvider(
          create: (context) => SubscriberBloc(
            repo: getIt<VideoPlayerRepository>(),
          ),
        ),
        BlocProvider(
          create: (context) => CommentsBloc(
            repo: getIt<VideoPlayerRepository>(),
          ),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppThemeManager.lightTheme,
        initialRoute: SplashScreen.id,
        onGenerateRoute: AppRouteManager.route,
      ),
    );
  }
}
