// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:youtube_clone/features/profile/data/model/profile_model.dart';

import '../../../../../core/utils/manager/app_color_manager.dart';

class ProfileInformation extends StatelessWidget {
  const ProfileInformation({
    Key? key,
    required this.profile,
  }) : super(key: key);

  final ProfileModel profile;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 20,
        horizontal: 70,
      ),
      child: Row(
        children: [
          const CircleAvatar(
            maxRadius: 37,
            foregroundImage: AssetImage("assets/images/profile.jpg"),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(
                left: 10,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    profile.result.user.fullname,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    "${profile.result.subscribers.count} Subscribers",
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                ],
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: !profile.result.subscribers.status
                  ? AppColorManager.red
                  : AppColorManager.greyColor,
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 17,
              ),
            ),
            child: const Text("Subscribe"),
          ),
        ],
      ),
    );
  }
}
