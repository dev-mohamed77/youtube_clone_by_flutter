import 'package:flutter/material.dart';
import 'package:youtube_clone/core/components/svg_custom.dart';
import 'package:youtube_clone/features/auth/presentation/pages/widgets/auth_text.dart';

import '../../../../../core/utils/config/assets_config.dart';
import '../../../../../core/utils/config/strings_config.dart';
import 'widgets/login_form.dart';

class LoginScreenLarge extends StatelessWidget {
  const LoginScreenLarge({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Center(
      child: SingleChildScrollView(
        child: Row(
          children: [
            Expanded(
              flex: 3,
              child: Column(
                children: [
                  AuthText(
                    text: StringsConfig.loginInCommunity,
                    fontSize: size.width <= 1150 ? 18 : 22,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SvgCustom(
                    path: AssetsConfig.login,
                    size: size.width <= 1150 ? 300 : 400,
                  ),
                ],
              ),
            ),
            Expanded(
              flex: size.width <= 1150 ? 3 : 2,
              child: Row(
                children: [
                  SizedBox(
                    width: size.width <= 1150 ? 400 : 450,
                    child: LoginForm(),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
