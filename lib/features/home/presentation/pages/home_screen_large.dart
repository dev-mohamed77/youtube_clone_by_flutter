import 'package:flutter/material.dart';
import 'package:youtube_clone/features/home/presentation/pages/widgets/home_grid_view_custom.dart';
import 'package:youtube_clone/features/home/presentation/pages/widgets/menu_custom.dart';

import '../../../../core/components/appbar_custom.dart';

class HomeScreenLarge extends StatelessWidget {
  const HomeScreenLarge({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarCustom(),
      body: Row(
        children: [
          Container(
            width: 230,
            alignment: Alignment.topCenter,
            child: const MenuCustom(),
          ),
          const Expanded(
            child: HomeGridViewCustom(),
          ),
        ],
      ),
    );
  }
}
