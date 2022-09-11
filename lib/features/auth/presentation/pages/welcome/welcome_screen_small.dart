import 'package:flutter/material.dart';
import 'package:youtube_clone/core/components/svg_custom.dart';
import 'package:youtube_clone/features/auth/presentation/pages/welcome/widgets/welcome_button.dart';

import '../../../../../core/utils/config/assets_config.dart';
import '../../../../../core/utils/config/strings_config.dart';
import '../widgets/auth_text.dart';

class WelcomeScreenSmall extends StatelessWidget {
  const WelcomeScreenSmall({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Column(
          children: const [
            SvgCustom(
              path: AssetsConfig.welcome,
            ),
            SizedBox(
              height: 20,
            ),
            AuthText(
              text: StringsConfig.registerInCommunity,
            ),
            SizedBox(
              height: 50,
            ),
            WelcomeButton(),
          ],
        ),
      ),
    );
  }
}
