import 'package:flutter/material.dart';
import 'package:youtube_clone/core/components/responsive.dart';
import 'package:youtube_clone/core/utils/config/strings_config.dart';
import 'package:youtube_clone/features/home/presentation/pages/widgets/outline_button_search.dart';

import '../utils/config/assets_config.dart';
import 'outline_button_login_custom.dart';
import '../../getit_injection.dart';
import '../../features/auth/data/datasource/auth_local_database.dart';

class AppBarCustom extends StatelessWidget with PreferredSizeWidget {
  const AppBarCustom({Key? key}) : super(key: key);

  bool getUser() {
    bool result = false;

    getIt<AuthLocalDataSource>().getUser()?.then((value) {
      if (value == null) {
        result = true;
      } else {
        result = false;
      }
    });
    return result;
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    // print(getUser.call());
    return AppBar(
      toolbarHeight: 60,
      flexibleSpace: SizedBox(
        height: double.infinity,
        child: Row(
          children: [
            if (!Responsive.isMobile(context))
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.menu),
              ),
            const SizedBox(
              width: 15,
            ),
            GestureDetector(
              onTap: !Responsive.isMobile(context) ? () {} : null,
              child: Row(
                children: [
                  Image.asset(
                    AssetsConfig.youtube_icon,
                    width: 30,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    StringsConfig.youtube,
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ],
              ),
            ),
            const Spacer(),
            !Responsive.isMobile(context)
                ? Row(
                    children: [
                      Container(
                        width: size.width * 0.25,
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: TextFormField(
                          decoration: const InputDecoration(
                            hintText: "Search",
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.grey,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const OutLineButtonSearch()
                    ],
                  )
                : IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.search),
                  ),
            if (!Responsive.isMobile(context)) const Spacer(),
            PopupMenuButton(
              itemBuilder: (context) {
                return [];
              },
            ),
            if (!Responsive.isMobile(context))
              const SizedBox(
                width: 15,
              ),
            !getUser()
                ? const OutlinedButtonLoginCustom()
                : const CircleAvatar(
                    backgroundColor: Colors.red,
                  ),
            const SizedBox(
              width: 15,
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size(0, 60);
}
