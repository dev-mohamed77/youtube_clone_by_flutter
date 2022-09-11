import 'package:flutter/material.dart';
import 'package:youtube_clone/core/utils/config/strings_config.dart';
import 'package:youtube_clone/features/auth/presentation/pages/widgets/auth_text.dart';

import '../../../../../core/components/svg_custom.dart';
import '../../../../../core/utils/config/assets_config.dart';
import 'widgets/login_form.dart';

class LoginScreenSmall extends StatelessWidget {
  const LoginScreenSmall({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SvgCustom(
              path: AssetsConfig.register,
            ),
            const SizedBox(
              height: 20,
            ),
            const AuthText(
              text: StringsConfig.loginInCommunity,
            ),
            const SizedBox(
              height: 20,
            ),
            LoginForm(),
          ],
        ),
      ),
    );
  }
}
