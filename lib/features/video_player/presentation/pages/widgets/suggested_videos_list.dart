import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:youtube_clone/core/components/loading_custom.dart';
import 'package:youtube_clone/core/components/responsive.dart';
import 'package:youtube_clone/core/components/video_card.dart';
import 'package:youtube_clone/features/video_player/presentation/pages/widgets/suggested_video_card_desktop.dart';

import '../../../../../core/components/error/error_screen.dart';
import '../../../../../core/utils/config/assets_config.dart';
import '../../../../../core/utils/config/strings_config.dart';
import '../../../../home/presentation/blocs/home_bloc/home_bloc.dart';
import '../../../../home/presentation/blocs/home_bloc/home_state.dart';

class SuggestedVideosList extends StatelessWidget {
  const SuggestedVideosList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        if (state is HomeStateGetVideosLoading) {
          return const LoadingCustom();
        } else if (state is HomeStateGetVideosSuccess) {
          return ListView.builder(
            itemCount: state.videos.length,
            shrinkWrap: true,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            itemBuilder: (context, index) {
              return state.videos.isNotEmpty
                  ? Responsive.isDesktop(context)
                      ? SuggestedVideoCardDeskTop(
                          video: state.videos[index],
                        )
                      : VideoCard(video: state.videos[index])
                  : const Center(
                      child: Text(StringsConfig.noVideos),
                    );
            },
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
