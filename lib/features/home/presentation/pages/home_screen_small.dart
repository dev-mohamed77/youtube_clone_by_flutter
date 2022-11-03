// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:miniplayer/miniplayer.dart';
import 'package:video_player/video_player.dart';

import 'package:youtube_clone/core/utils/manager/app_color_manager.dart';
import 'package:youtube_clone/core/utils/manager/app_dialog_manager.dart';
import 'package:youtube_clone/features/home/presentation/blocs/add_video_bloc/add_video_bloc.dart';
import 'package:youtube_clone/features/home/presentation/blocs/home_video_player_bloc/home_video_player_event.dart';
import 'package:youtube_clone/features/home/presentation/pages/widgets/add_video_custom.dart';
import 'package:youtube_clone/features/home/presentation/pages/widgets/custom_sliver_appbar.dart';
import 'package:youtube_clone/features/home/presentation/pages/widgets/home_grid_view_custom.dart';
import 'package:youtube_clone/features/profile/presentation/pages/profile_screen.dart';
import 'package:youtube_clone/features/video_player/presentation/pages/video_player_screen.dart';
import 'package:youtube_clone/getit_injection.dart';

import '../../../video_player/presentation/blocs/video_bloc/video_bloc.dart';
import '../../../video_player/presentation/blocs/video_player_bloc/video_player_bloc.dart';
import '../../../video_player/presentation/blocs/video_player_bloc/video_player_state.dart';
import '../../domain/repository/home_repository.dart';
import '../blocs/add_video_bloc/add_video_event.dart';
import '../blocs/add_video_bloc/add_video_state.dart';
import '../blocs/home_bloc/home_bloc.dart';
import '../blocs/home_bloc/home_event.dart';
import '../blocs/home_video_player_bloc/home_video_player_bloc.dart';
import '../blocs/home_video_player_bloc/home_video_player_state.dart';

class HomeScreenSmall extends StatefulWidget {
  const HomeScreenSmall({Key? key}) : super(key: key);

  @override
  State<HomeScreenSmall> createState() => _HomeScreenSmallState();
}

class _HomeScreenSmallState extends State<HomeScreenSmall> {
  int _currentIndex = 0;

  final List<Widget> _screen = [
    const HomePage(),
    const ExplorePage(),
    const SizedBox(),
    const SubPage(),
    const Scaffold(
      body: Center(
        child: Text("Library"),
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<HomeVideoPlayerBloc, HomeVideoPlayerState>(
        builder: (context, state) {
          return Stack(
            children: _screen
                .asMap()
                .map((i, screen) {
                  return MapEntry(
                    i,
                    Offstage(
                      offstage: i != _currentIndex,
                      child: screen,
                    ),
                  );
                })
                .values
                .toList()
              ..add(
                Offstage(
                  offstage: state.showProfile,
                  child: const ProfileScreen(),
                ),
              )
              ..add(
                Offstage(
                  offstage: state.showMiniPlayer,
                  child: Miniplayer(
                    minHeight: 70,
                    maxHeight: MediaQuery.of(context).size.height,
                    controller: state.miniplayerController,
                    builder: (height, percentage) {
                      if (state.showMiniPlayer) {
                        return const SizedBox.shrink();
                      }
                      if (height <= 100) {
                        return const HomeMiniPlayer();
                      } else {
                        return BlocProvider(
                          create: (context) => HomeBloc(
                            repo: getIt<HomeRepository>(),
                          )..add(
                              HomeEventGetVideosRandom(limit: 40, page: 1),
                            ),
                          child: VideoPlayerScreen(
                            height: height,
                          ),
                        );
                      }
                    },
                  ),
                ),
              ),
          );
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        currentIndex: _currentIndex,
        selectedItemColor: AppColorManager.blackColor,
        unselectedItemColor: AppColorManager.greyColor,
        type: BottomNavigationBarType.fixed,
        onTap: (value) {
          setState(() => _currentIndex = value);
          if (value == 0) {
            context.read<HomeBloc>().add(
                  HomeEventGetVideosRandom(limit: 40, page: 1),
                );
          } else if (value == 1) {
            context.read<HomeBloc>().add(
                  HomeEventGetVideosTrend(limit: 40, page: 1),
                );
          } else if (value == 2) {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => BlocProvider(
                  create: (context) => AddVideoBloc(),
                  child: const AddPage(),
                ),
              ),
            );
          } else if (value == 3) {
            context.read<HomeBloc>().add(
                  HomeEventGetVideosSub(),
                );
          } else if (value == 4) {
            print(value);
            print("Library");
          }
        },
        items: const [
          BottomNavigationBarItem(
            label: "Home",
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            label: "Explore",
            icon: Icon(Icons.explore_outlined),
            activeIcon: Icon(Icons.explore),
          ),
          BottomNavigationBarItem(
            label: "Add",
            icon: Icon(Icons.add_circle_outline),
            activeIcon: Icon(Icons.add_circle),
          ),
          BottomNavigationBarItem(
              label: "Sup",
              icon: Icon(Icons.subscriptions_outlined),
              activeIcon: Icon(Icons.subscriptions)),
          BottomNavigationBarItem(
            label: "Library",
            icon: Icon(Icons.video_library_outlined),
            activeIcon: Icon(Icons.video_library),
          ),
        ],
      ),
    );
  }
}

class HomeMiniPlayer extends StatelessWidget {
  const HomeMiniPlayer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: Column(
        children: [
          Row(
            children: [
              SizedBox(
                height: 56,
                width: 120,
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
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "title title title title ",
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: Theme.of(context).textTheme.bodyText2!.copyWith(
                              fontWeight: FontWeight.w500,
                            ),
                      ),
                      Text(
                        "Caption Caption Caption Caption ",
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: Theme.of(context).textTheme.caption,
                      ),
                    ],
                  ),
                ),
              ),
              _iconButtonMiniPlayer(
                icon: Icons.play_arrow,
                onClick: () {
                  context
                      .watch<VideoPlayerBloc>()
                      .chewieController
                      .togglePause();
                },
              ),
              _iconButtonMiniPlayer(
                icon: Icons.close_outlined,
                onClick: () {
                  context.watch<VideoPlayerBloc>().chewieController.pause();
                  context.read<HomeVideoPlayerBloc>().add(
                        GetHomeVideoPlayerShowMiniPlayerWithPanelStateMaxEvent(
                          showMiniPlayer: true,
                        ),
                      );
                },
              ),
            ],
          ),
          const LinearProgressIndicator(
            value: 0.4,
            valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
          )
        ],
      ),
    );
  }

  Widget _iconButtonMiniPlayer({
    required IconData icon,
    required void Function() onClick,
  }) {
    return IconButton(
      onPressed: onClick,
      iconSize: 30,
      color: AppColorManager.blackColor.withOpacity(0.7),
      icon: Icon(icon),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CustomScrollView(
        slivers: [
          CustomSliverAppBar(),
          SliverToBoxAdapter(
            child: HomeGridViewCustom(),
          ),
        ],
      ),
    );
  }
}

class ExplorePage extends StatelessWidget {
  const ExplorePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CustomScrollView(
        slivers: [
          CustomSliverAppBar(),
          SliverToBoxAdapter(
            child: HomeGridViewCustom(),
          ),
        ],
      ),
    );
  }
}

class SubPage extends StatelessWidget {
  const SubPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CustomScrollView(
        slivers: [
          CustomSliverAppBar(),
          SliverToBoxAdapter(
            child: HomeGridViewCustom(),
          ),
        ],
      ),
    );
  }
}
