// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:timeago/timeago.dart' as timeago;

import 'package:youtube_clone/core/components/bottom_sheet_custom.dart';
import 'package:youtube_clone/core/utils/manager/app_dialog_manager.dart';
import 'package:youtube_clone/features/video_player/presentation/pages/widgets/video_info_in_bottom_sheet.dart';

import '../../../data/model/video_player_model.dart';

class VideoInfoMobile extends StatefulWidget {
  const VideoInfoMobile({
    Key? key,
    required this.video,
    required this.height,
  }) : super(key: key);

  final VideoPlayerDataModel video;
  final double height;

  @override
  State<VideoInfoMobile> createState() => _VideoInfoMobileState();
}

class _VideoInfoMobileState extends State<VideoInfoMobile> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        AppDialogManager.showBottomSheetApp(
          context,
          BottomSheetCustom(
            text: "Description",
            height: widget.height,
            child: VideoInformationInBottomSheet(
              video: widget.video,
            ),
          ),
        );
      },
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 10,
            horizontal: 10,
          ),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.video.title,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      "${widget.video.views} Views . ${timeago.format(DateTime.parse(widget.video.createdAt))}",
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context)
                          .textTheme
                          .caption!
                          .copyWith(fontSize: 13),
                    ),
                  ],
                ),
              ),
              const Icon(Icons.keyboard_arrow_down_outlined)
            ],
          ),
        ),
      ),
    );
  }
}
