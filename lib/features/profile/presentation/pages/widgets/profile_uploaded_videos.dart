import 'package:flutter/material.dart';
import 'package:timeago/timeago.dart' as timeago;

import '../../../../../core/utils/config/strings_config.dart';
import '../../../data/model/profile_model.dart';

class ProfileUploadedVideos extends StatelessWidget {
  const ProfileUploadedVideos({
    Key? key,
    required this.videos,
  }) : super(key: key);

  final List<ProfileVideos> videos;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          StringsConfig.uploadedVideos,
          style: Theme.of(context)
              .textTheme
              .titleMedium!
              .copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 20,
        ),
        Expanded(
          child: ListView.builder(
            itemCount: videos.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      "assets/images/profile.jpg",
                      width: 150,
                      height: 100,
                      fit: BoxFit.fill,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            videos[index].title,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                          const SizedBox(
                            height: 7,
                          ),
                          _captionText(
                            context,
                            "${videos[index].views} Views . ${timeago.format(DateTime.parse(videos[index].createdAt))}",
                            1,
                          ),
                          const SizedBox(
                            height: 7,
                          ),
                          _captionText(
                            context,
                            videos[index].description,
                            3,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Text _captionText(BuildContext context, String text, int maxLines) {
    return Text(
      text,
      overflow: TextOverflow.ellipsis,
      maxLines: maxLines,
      style: Theme.of(context).textTheme.caption!.copyWith(
            fontWeight: FontWeight.bold,
          ),
    );
  }
}
