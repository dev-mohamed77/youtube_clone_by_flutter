import 'package:flutter/material.dart';
import 'package:youtube_clone/features/profile/presentation/pages/widgets/profile_video_card.dart';

import '../../../../../core/utils/manager/app_color_manager.dart';
import '../../../data/model/profile_model.dart';

class ProfileLastFiveVideoInHomePage extends StatefulWidget {
  const ProfileLastFiveVideoInHomePage({
    Key? key,
    required this.videos,
  }) : super(key: key);

  final List<ProfileVideos> videos;

  @override
  State<ProfileLastFiveVideoInHomePage> createState() =>
      _ProfileLastFiveVideoInHomePageState();
}

class _ProfileLastFiveVideoInHomePageState
    extends State<ProfileLastFiveVideoInHomePage> {
  late ScrollController _controller;
  @override
  void initState() {
    _controller = ScrollController();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 230,
      width: MediaQuery.of(context).size.width,
      child: Stack(
        alignment: Alignment.centerRight,
        children: [
          ListView.separated(
            controller: _controller,
            scrollDirection: Axis.horizontal,
            itemCount: widget.videos.length < 10 ? widget.videos.length : 10,
            itemBuilder: (context, index) {
              return Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                child: ProfileVideoCard(
                  video: widget.videos[index],
                  imageWidth: 200,
                ),
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return const SizedBox(
                width: 15,
              );
            },
          ),
          CircleAvatar(
            maxRadius: 30,
            foregroundColor: AppColorManager.greyColor,
            backgroundColor: AppColorManager.greyColor,
            child: IconButton(
              color: AppColorManager.greyColor,
              onPressed: () {
                _controller.animateTo(
                  _controller.position.pixels + 200,
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeIn,
                );
              },
              icon: const Icon(
                Icons.arrow_back_ios_new_sharp,
                color: AppColorManager.whiteColor,
              ),
            ),
          ),
          Positioned(
            left: 0,
            child: CircleAvatar(
              maxRadius: 30,
              backgroundColor: AppColorManager.greyColor,
              foregroundColor: AppColorManager.greyColor,
              child: IconButton(
                color: AppColorManager.greyColor,
                onPressed: () {
                  _controller.animateTo(
                    _controller.position.pixels - 200,
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeIn,
                  );
                },
                icon: const Icon(
                  Icons.arrow_back_ios_new_sharp,
                  color: AppColorManager.whiteColor,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
