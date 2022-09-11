import 'package:flutter/material.dart';
import 'package:youtube_clone/features/auth/presentation/pages/login/login_screen.dart';
import 'package:youtube_clone/features/auth/presentation/pages/register/register_screen.dart';
import 'package:youtube_clone/features/home/presentation/pages/home_screen.dart';

import '../../../../../../core/components/button_custom.dart';
import '../../../../../../core/utils/config/strings_config.dart';
import '../../../../../../core/utils/manager/app_color_manager.dart';

class WelcomeButton extends StatelessWidget {
  const WelcomeButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      children: [
        ButtonCustom(
          width: size.width - 40,
          text: StringsConfig.login,
          onClick: () {
            Navigator.pushNamed(
              context,
              LoginScreen.id,
            );
          },
        ),
        const SizedBox(
          height: 15,
        ),
        ButtonCustom(
          width: size.width - 40,
          text: StringsConfig.register,
          colorShadow: AppColorManager.customPurple.withOpacity(0.25),
          color: AppColorManager.customPurple,
          onClick: () {
            Navigator.of(context).pushNamed(RegisterScreen.id);
          },
        ),
        const SizedBox(
          height: 15,
        ),
        ButtonCustom(
          width: size.width - 40,
          colorShadow: AppColorManager.lightPurple.withOpacity(0.25),
          color: AppColorManager.lightPurple,
          text: StringsConfig.ghost,
          onClick: () {
            Navigator.of(context).pushNamed(HomeScreen.id);
          },
        ),
      ],
    );
  }
}
