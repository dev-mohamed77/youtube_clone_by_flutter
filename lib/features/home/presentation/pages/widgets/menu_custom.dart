import 'package:flutter/material.dart';
import 'package:youtube_clone/features/home/presentation/pages/widgets/top_header_items.dart';

import 'bottom_header_items.dart';
import 'header_explore.dart';
import 'header_login.dart';

class MenuCustom extends StatelessWidget {
  const MenuCustom({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const TopHeadersItems(),
          Divider(
            height: 1,
            color: Colors.grey.withOpacity(0.4),
          ),
          const HeaderLogin(),
          const SizedBox(
            height: 10,
          ),
          Divider(
            height: 1,
            color: Colors.grey.withOpacity(0.4),
          ),
          const HeadersExplore(),
          const SizedBox(
            height: 10,
          ),
          Divider(
            height: 1,
            color: Colors.grey.withOpacity(0.4),
          ),
          const BottomHeadersItem()
        ],
      ),
    );
  }
}
