// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:youtube_clone/core/components/appbar_custom.dart';
import 'package:youtube_clone/core/utils/config/assets_config.dart';
import 'package:youtube_clone/core/utils/manager/app_color_manager.dart';

import '../blocs/video_player_bloc/video_player_bloc.dart';
import '../blocs/video_player_bloc/video_player_event.dart';

class VideoPlayerScreenLarge extends StatefulWidget {
  const VideoPlayerScreenLarge({
    Key? key,
    required this.videoId,
  }) : super(key: key);

  final String videoId;

  @override
  State<VideoPlayerScreenLarge> createState() => _VideoPlayerScreenLargeState();
}

class _VideoPlayerScreenLargeState extends State<VideoPlayerScreenLarge> {
  // late VideoPlayerController videoController;

  @override
  void initState() {
    context.read<VideoPlayerBloc>().add(VideoPlayerGetVideoEvent(
          videoId: widget.videoId,
        ));
    // videoController = VideoPlayerController.asset("assets/video_demo.mp4")
    //   ..initialize().then((_) {
    //     setState(() {});
    //     videoController.play();
    //   });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarCustom(),
      body: SingleChildScrollView(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 6,
              child: Padding(
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
                        Row(
                          children: [
                            Text(
                              "100 views",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText2!
                                  .copyWith(
                                    color: Colors.grey[600],
                                    fontSize: 14,
                                  ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              "100 Duration",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText2!
                                  .copyWith(
                                    color: Colors.grey[600],
                                    fontSize: 14,
                                  ),
                            ),
                          ],
                        ),
                        const Spacer(),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 15),
                              child: Row(
                                children: const [
                                  Icon(Icons.favorite_border_outlined),
                                  Text("Like"),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 15),
                              child: Row(
                                children: const [
                                  Icon(Icons.favorite_border_outlined),
                                  Text("Like"),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 15),
                              child: Row(
                                children: const [
                                  Icon(Icons.favorite_border_outlined),
                                  Text("Like"),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 15),
                              child: Row(
                                children: const [
                                  Icon(Icons.favorite_border_outlined),
                                  Text("Like"),
                                ],
                              ),
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
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText2!
                                  .copyWith(
                                    fontSize: 15,
                                  ),
                            ),
                            Text(
                              "45K Subscribers",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText2!
                                  .copyWith(
                                    color: Colors.grey[600],
                                    fontSize: 14,
                                  ),
                            ),
                          ],
                        ),
                        const Spacer(),
                        Material(
                          color: const Color.fromARGB(255, 228, 20, 5),
                          child: Container(
                            width: 120,
                            height: 40,
                            alignment: Alignment.center,
                            child: Text(
                              "SUBSCRIBE",
                              textAlign: TextAlign.center,
                              style: Theme.of(context).textTheme.caption,
                            ),
                          ),
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
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width < 1200 ? 350 : 400,
              child: ListView.builder(
                itemCount: 20,
                shrinkWrap: true,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                itemBuilder: (context, index) {
                  return ConstrainedBox(
                    constraints: const BoxConstraints(
                      maxHeight: 130,
                    ),
                    child: Container(
                      color: Colors.blueAccent,
                      margin: const EdgeInsets.symmetric(
                        vertical: 5,
                      ),
                      child: Row(
                        children: [
                          Image.asset(
                            "assets/images/profile.jpg",
                            width: 120,
                            height: double.infinity,
                            fit: BoxFit.cover,
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 8,
                                  ),
                                  child: Text(
                                    "Title TitleTitleTitleTitleTitle TitleTitleTitleTitleTitle",
                                    maxLines: 3,
                                    overflow: TextOverflow.ellipsis,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText2!
                                        .copyWith(),
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 8,
                                  ),
                                  child: Text(
                                    "Full name Full ",
                                    maxLines: 1,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText2!
                                        .copyWith(
                                          fontSize: 14,
                                          color: AppColorManager.greyColor,
                                        ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 8,
                                  ),
                                  child: Row(
                                    children: [
                                      Flexible(
                                        child: Text(
                                          "5 day ago",
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyText2!
                                              .copyWith(
                                                fontSize: 14,
                                                color:
                                                    AppColorManager.greyColor,
                                              ),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        "15 views",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText2!
                                            .copyWith(
                                              fontSize: 14,
                                              color: AppColorManager.greyColor,
                                            ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
