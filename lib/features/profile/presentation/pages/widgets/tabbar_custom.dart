import 'package:flutter/material.dart';
import 'package:youtube_clone/core/components/responsive.dart';
import 'package:youtube_clone/features/profile/presentation/pages/widgets/profile_home_page.dart';
import 'package:youtube_clone/features/profile/presentation/pages/widgets/profile_uploaded_videos.dart';

import '../../../../../core/utils/manager/app_color_manager.dart';
import '../../../data/model/profile_model.dart';

class TabBarCustom extends StatelessWidget {
  const TabBarCustom({
    Key? key,
    required this.profile,
  }) : super(key: key);

  final ProfileModel profile;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Padding(
        padding: Responsive.isMobile(context) || Responsive.isTablet(context)
            ? const EdgeInsets.symmetric(horizontal: 10)
            : const EdgeInsets.symmetric(horizontal: 150),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width:
                  Responsive.isMobile(context) || Responsive.isTablet(context)
                      ? MediaQuery.of(context).size.width
                      : MediaQuery.of(context).size.width / 2,
              child: TabBar(
                onTap: (value) {
                  print(value);
                },
                indicatorColor: Colors.red,
                indicatorWeight: 4,
                splashBorderRadius: BorderRadius.circular(15),
                isScrollable:
                    Responsive.isMobile(context) || Responsive.isTablet(context)
                        ? true
                        : false,
                labelPadding:
                    Responsive.isMobile(context) || Responsive.isTablet(context)
                        ? const EdgeInsets.all(15)
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
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height,
              child: TabBarView(
                children: [
                  ProfileHomePage(profile: profile),
                  ProfileUploadedVideos(videos: profile.result.videos),
                  const Center(child: Text("Videos")),
                  const Center(child: Text("Videos")),
                  const Center(child: Text("Videos")),
                ],
              ),
            )
          ],
        ),
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
