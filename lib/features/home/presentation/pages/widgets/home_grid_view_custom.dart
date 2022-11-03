import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:youtube_clone/core/components/loading_custom.dart';
import 'package:youtube_clone/core/components/responsive.dart';
import 'package:youtube_clone/core/utils/config/assets_config.dart';
import 'package:youtube_clone/core/utils/config/strings_config.dart';
import 'package:youtube_clone/core/components/video_card.dart';
import 'package:youtube_clone/features/profile/presentation/pages/profile_screen.dart';

import '../../../../../core/components/error/error_screen.dart';
import '../../../../profile/presentation/pages/profile_screen_small.dart';
import '../../blocs/home_bloc/home_bloc.dart';
import '../../blocs/home_bloc/home_state.dart';

class HomeGridViewCustom extends StatelessWidget {
  const HomeGridViewCustom({
    Key? key,
    bool isMiniPlayerPadding = false,
  })  : _isMiniPlayerPadding = isMiniPlayerPadding,
        super(key: key);

  final bool _isMiniPlayerPadding;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        if (state is HomeStateGetVideosLoading) {
          return const LoadingCustom();
        } else if (state is HomeStateGetVideosSuccess) {
          return state.videos.isNotEmpty
              ? Padding(
                  padding: _isMiniPlayerPadding
                      ? EdgeInsets.zero
                      : const EdgeInsets.all(15),
                  child: GridView.builder(
                    shrinkWrap: true,
                    itemCount: state.videos.length,
                    controller: ScrollController(),
                    padding: Responsive.isMobile(context) ||
                            Responsive.isTablet(context)
                        ? EdgeInsets.zero
                        : const EdgeInsets.only(
                            left: 45,
                            top: 20.0,
                            right: 60,
                            bottom: 100.0,
                          ),
                    gridDelegate:
                        const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 400,
                      mainAxisExtent: 310,
                      crossAxisSpacing: 15.0,
                      mainAxisSpacing: 15.0,
                    ),
                    itemBuilder: (BuildContext context, int index) {
                      return VideoCard(
                        video: state.videos[index],
                      );
                    },
                  ),
                )
              : const Center(
                  child: Text(StringsConfig.noVideos),
                );
        } else if (state is HomeStateGetVideosError) {
          if (state.err.contains("Page not found")) {
            return const ErrorScreen(
              title: StringsConfig.notFound,
              description: StringsConfig.notFoundDesc,
              pathImage: AssetsConfig.no_result,
            );
          } else if (state.err.contains("You are not authenticate")) {
            return ErrorScreen(
              title: state.err,
              description: StringsConfig.notAuthDesc,
              isButtonLogin: true,
            );
          } else {
            return ErrorScreen(
              title: state.err,
              description: "",
            );
          }
        }
        return const SizedBox.shrink();
      },
    );
  }
}
