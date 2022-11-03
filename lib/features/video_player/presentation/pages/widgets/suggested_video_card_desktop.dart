// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:timeago/timeago.dart' as timeago;
import '../../../../home/data/model/videos_model.dart';

class SuggestedVideoCardDeskTop extends StatelessWidget {
  const SuggestedVideoCardDeskTop({
    Key? key,
    required this.video,
  }) : super(key: key);

  final VideosDataModel video;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(
        maxHeight: 110,
      ),
      child: Padding(
        padding: const EdgeInsets.only(right: 10, bottom: 15, left: 5),
        child: InkWell(
          onTap: () {},
          child: Row(
            children: [
              Image.network(
                video.videoImage,
                width: 150,
                height: double.infinity,
                fit: BoxFit.cover,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        video.title,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.bodyText2!.copyWith(
                              fontSize: 15,
                              height: 1.3,
                            ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      _videoInfoText(context, video.user.fullname),
                      const SizedBox(
                        height: 5,
                      ),
                      _videoInfoText(
                        context,
                        "${video.view} views . ${timeago.format(DateTime.parse(video.createdAt))}",
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Text _videoInfoText(BuildContext context, String text) {
    return Text(
      text,
      overflow: TextOverflow.ellipsis,
      maxLines: 1,
      style: Theme.of(context).textTheme.caption,
    );
  }
}
