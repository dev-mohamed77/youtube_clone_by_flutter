import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:youtube_clone/features/home/presentation/blocs/home_bloc/home_bloc.dart';
import 'package:youtube_clone/features/home/presentation/blocs/home_bloc/home_event.dart';
import 'package:youtube_clone/features/home/presentation/pages/widgets/header_item.dart';

class TopHeadersItems extends StatelessWidget {
  const TopHeadersItems({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        HeaderItem(
          icon: Icons.home,
          title: 'Home',
          onClick: () {
            context.read<HomeBloc>().add(
                  HomeEventGetVideosRandom(limit: 40, page: 1),
                );
          },
        ),
        HeaderItem(
          icon: Icons.explore,
          title: 'Explore',
          onClick: () {
            context.read<HomeBloc>().add(
                  HomeEventGetVideosTrend(limit: 40, page: 1),
                );
          },
        ),
        HeaderItem(
          icon: Icons.video_settings,
          title: 'Shorts',
          onClick: () {},
        ),
        HeaderItem(
          icon: Icons.subscriptions,
          title: 'Subscriptions',
          onClick: () {
            context.read<HomeBloc>().add(
                  HomeEventGetVideosSub(),
                );
          },
        ),
        const SizedBox(
          height: 10,
        ),
        Divider(
          height: 1,
          color: Colors.grey.withOpacity(0.4),
        ),
        HeaderItem(
          icon: Icons.video_collection_outlined,
          title: 'Library',
          onClick: () {},
        ),
        HeaderItem(
          icon: Icons.history,
          title: 'History',
          onClick: () {},
        ),
      ],
    );
  }
}
