import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:youtube_clone/core/components/loading_custom.dart';
import 'package:youtube_clone/features/video_player/presentation/pages/widgets/react_button_desktop.dart';
import 'package:youtube_clone/features/video_player/presentation/pages/widgets/subscriber_button_desktop.dart';

import '../../../../../core/components/error/error_screen.dart';
import '../../../../../core/utils/config/assets_config.dart';
import '../../../../../core/utils/config/strings_config.dart';
import '../../../../../core/utils/manager/app_color_manager.dart';
import '../../blocs/video_bloc/video_bloc.dart';
import '../../blocs/video_bloc/video_state.dart';

class VideoInfo extends StatelessWidget {
  const VideoInfo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<VideoBloc, VideoState>(
      builder: (context, state) {
        if (state is VideoLoadingState) {
          return const LoadingCustom();
        } else if (state is VideoSuccessState) {
          return Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AspectRatio(
                  aspectRatio: 3 / 1.6,
                  child: Container(color: Colors.red),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "title",
                  style: Theme.of(context).textTheme.headline6,
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Text(
                      "100 views . Sep 25,2022",
                      style: Theme.of(context).textTheme.bodyText2!.copyWith(
                            color: Colors.grey[600],
                            fontSize: 14,
                          ),
                    ),
                    const Spacer(),
                    Row(
                      children: [
                        ReactButtonDesktop(
                          text: "Like",
                          icon: Icons.favorite_border_outlined,
                          onClick: () {},
                        ),
                        ReactButtonDesktop(
                          text: "Like",
                          icon: Icons.favorite_border_outlined,
                          onClick: () {},
                        ),
                        ReactButtonDesktop(
                          text: "Like",
                          icon: Icons.favorite_border_outlined,
                          onClick: () {},
                        ),
                        ReactButtonDesktop(
                          text: "Like",
                          icon: Icons.favorite_border_outlined,
                          onClick: () {},
                        ),
                      ],
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.more_horiz),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                const Divider(
                  thickness: 0.5,
                  color: AppColorManager.greyColor,
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Image.asset(
                      AssetsConfig.youtube_icon,
                      width: 50,
                      height: 50,
                      fit: BoxFit.cover,
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Mohamed Abdel Nasser",
                          style:
                              Theme.of(context).textTheme.bodyText1!.copyWith(
                                    fontSize: 15,
                                  ),
                        ),
                        const Text(
                          "45K Subscribers",
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                      ],
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    const Spacer(),
                    SubscriberButtonDeskTop(
                      onClick: () {},
                    ),
                  ],
                ),
                const SizedBox(
                  height: 50,
                ),
                Container(
                  padding: const EdgeInsets.only(left: 120),
                  child: Text(
                    "description description description description description description ",
                    style: Theme.of(context).textTheme.bodyText2!.copyWith(
                          fontSize: 15,
                        ),
                  ),
                ),
              ],
            ),
          );
        } else if (state is VideoErrorState) {
          if (state.error.contains("Page not found")) {
            return const ErrorScreen(
              title: StringsConfig.notFound,
              description: StringsConfig.notFoundDesc,
              pathImage: AssetsConfig.no_result,
            );
          } else if (state.error.contains("You are not authenticate")) {
            return ErrorScreen(
              title: state.error,
              description: StringsConfig.notAuthDesc,
              isButtonLogin: true,
            );
          } else {
            return ErrorScreen(
              title: state.error,
              description: "",
            );
          }
        }
        return const SizedBox.shrink();
      },
    );
  }
}
