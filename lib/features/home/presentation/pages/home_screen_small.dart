import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:miniplayer/miniplayer.dart';
import 'package:youtube_clone/core/utils/manager/app_color_manager.dart';
import 'package:youtube_clone/features/home/presentation/blocs/home_video_player_bloc/home_video_player_event.dart';
import 'package:youtube_clone/features/home/presentation/pages/widgets/custom_sliver_appbar.dart';
import 'package:youtube_clone/features/home/presentation/pages/widgets/home_grid_view_custom.dart';
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const CustomScrollView(
            slivers: [
              CustomSliverAppBar(),
              SliverToBoxAdapter(
                child: HomeGridViewCustom(),
              ),
            ],
          ),
          BlocBuilder<HomeVideoPlayerBloc, HomeVideoPlayerState>(
            builder: (context, state) {
              return Offstage(
                offstage: state.showMiniPlayer,
                child: Miniplayer(
                  minHeight: 60,
                  maxHeight: MediaQuery.of(context).size.height,
                  controller: state.miniplayerController,
                  builder: (height, percentage) {
                    return Material(
                      color: Theme.of(context).scaffoldBackgroundColor,
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Image.asset(
                                "assets/images/profile.jpg",
                                width: 120,
                                height: 56,
                                fit: BoxFit.cover,
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "title title title title ",
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 1,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText2!
                                            .copyWith(
                                              fontWeight: FontWeight.w500,
                                            ),
                                      ),
                                      Text(
                                        "Caption Caption Caption Caption ",
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 1,
                                        style:
                                            Theme.of(context).textTheme.caption,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              _iconButtonMiniPlayer(
                                icon: Icons.play_arrow,
                                onClick: () {},
                              ),
                              _iconButtonMiniPlayer(
                                icon: Icons.close_outlined,
                                onClick: () {
                                  context.read<HomeVideoPlayerBloc>().add(
                                        GetHomeVideoPlayerEvent(
                                          showMiniPlayer: true,
                                        ),
                                      );
                                },
                              ),
                            ],
                          ),
                          const LinearProgressIndicator(
                            value: 0.4,
                            valueColor:
                                AlwaysStoppedAnimation<Color>(Colors.red),
                          )
                        ],
                      ),
                    );
                  },
                ),
              );
            },
          ),
        ],
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
            print(value);
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
