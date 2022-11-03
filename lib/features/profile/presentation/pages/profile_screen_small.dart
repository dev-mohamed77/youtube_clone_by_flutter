// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:youtube_clone/core/components/error/error_screen.dart';
import 'package:youtube_clone/core/components/loading_custom.dart';
import 'package:youtube_clone/features/profile/presentation/pages/widgets/profile_home_page.dart';
import 'package:youtube_clone/features/profile/presentation/pages/widgets/profile_uploaded_videos.dart';
import 'package:youtube_clone/features/profile/presentation/pages/widgets/tabbar_custom.dart';

import '../../../../core/components/responsive.dart';
import '../../../../core/utils/manager/app_color_manager.dart';
import '../../../home/presentation/blocs/home_video_player_bloc/home_video_player_bloc.dart';
import '../../../home/presentation/blocs/home_video_player_bloc/home_video_player_event.dart';
import '../../data/model/profile_model.dart';
import '../blocs/profile_bloc/profile_bloc.dart';
import '../blocs/profile_bloc/profile_state.dart';

class ProfileScreenSmall extends StatefulWidget {
  const ProfileScreenSmall({
    Key? key,
  }) : super(key: key);

  @override
  State<ProfileScreenSmall> createState() => _ProfileScreenSmallState();
}

class _ProfileScreenSmallState extends State<ProfileScreenSmall>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  @override
  void initState() {
    super.initState();
    tabController = TabController(vsync: this, length: 5);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<ProfileBloc, ProfileState>(
        builder: (context, state) {
          if (state is GetProfileStateLoading) {
            return const LoadingCustom();
          } else if (state is GetProfileStateSuccess) {
            return CustomScrollView(
              slivers: [
                SliverAppBar(
                  floating: true,
                  pinned: true,
                  leading: IconButton(
                    icon: const Icon(Icons.arrow_back_rounded),
                    onPressed: () {
                      context.read<HomeVideoPlayerBloc>().add(
                            HomeVideoPlayerEventShowProfile(
                              showProfile: true,
                            ),
                          );
                    },
                  ),
                  title: Text(state.data.result.user.fullname),
                  bottom: TabBar(
                    controller: tabController,
                    indicatorColor: Colors.red,
                    indicatorWeight: 4,
                    splashBorderRadius: BorderRadius.circular(15),
                    isScrollable: Responsive.isMobile(context) ||
                            Responsive.isTablet(context)
                        ? true
                        : false,
                    labelPadding: Responsive.isMobile(context) ||
                            Responsive.isTablet(context)
                        ? const EdgeInsets.symmetric(
                            horizontal: 30,
                            vertical: 13,
                          )
                        : const EdgeInsets.all(15),
                    labelStyle: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(color: AppColorManager.red),
                    tabs: [
                      _titleTabs(context, "Home"),
                      _titleTabs(context, "Videos"),
                      _titleTabs(context, "Home"),
                      _titleTabs(context, "Home"),
                      _titleTabs(context, "Home"),
                    ],
                  ),
                  titleTextStyle: Theme.of(context).textTheme.bodyLarge,
                  actions: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.search),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.more_vert_outlined),
                    ),
                  ],
                ),
                SliverToBoxAdapter(
                  child: ProfileMobile(
                    data: state.data,
                    tabController: tabController,
                  ),
                ),
              ],
            );
          } else if (state is GetProfileStateError) {
            return ErrorScreen(
              title: state.error,
              description: state.error,
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }

  Widget _titleTabs(BuildContext context, String title) {
    return Text(
      title,
      style: Theme.of(context)
          .textTheme
          .titleMedium!
          .copyWith(color: AppColorManager.blackColor),
    );
  }
}

class ProfileMobile extends StatelessWidget {
  const ProfileMobile({
    Key? key,
    required this.data,
    required this.tabController,
  }) : super(key: key);

  final TabController tabController;
  final ProfileModel data;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: TabBarView(
        controller: tabController,
        children: [
          ProfileHomePage(profile: data),
          ProfileUploadedVideos(videos: data.result.videos),
          const Center(child: Text("Videos")),
          const Center(child: Text("Videos")),
          const Center(child: Text("Videos")),
        ],
      ),
    );
  }
}
