import 'package:flutter/widgets.dart';
import 'package:youtube_clone/core/components/svg_custom.dart';
import 'package:youtube_clone/core/utils/config/assets_config.dart';
import 'package:youtube_clone/core/utils/config/strings_config.dart';
import 'package:youtube_clone/features/auth/presentation/pages/register/widgets/register_form.dart';
import 'package:youtube_clone/features/auth/presentation/pages/widgets/auth_text.dart';

class RegisterScreenSmall extends StatelessWidget {
  const RegisterScreenSmall({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SvgCustom(
              path: AssetsConfig.login,
            ),
            const SizedBox(
              height: 20,
            ),
            const AuthText(
              text: StringsConfig.registerInCommunity,
            ),
            const SizedBox(
              height: 20,
            ),
            RegisterForm(),
          ],
        ),
      ),
    );
  }
}
