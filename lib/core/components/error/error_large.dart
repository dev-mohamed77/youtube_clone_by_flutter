import 'package:flutter/material.dart';
import 'package:youtube_clone/core/components/error_image_handle.dart';
import 'package:youtube_clone/core/components/error_text.dart';
import '../../utils/config/strings_config.dart';
import '../outline_button_login_custom.dart';

class ErrorScreenLarge extends StatelessWidget {
  const ErrorScreenLarge({
    Key? key,
    required this.pathImage,
    required this.title,
    required this.description,
    required this.isButtonLogin,
  }) : super(key: key);
  final String? pathImage;
  final String title;
  final String description;
  final bool isButtonLogin;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        controller: ScrollController(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ErrorImageHandle(
              width: 200,
              pathImage: pathImage,
            ),
            const SizedBox(
              height: 20,
            ),
            ErrorText(
              text: title,
              bold: true,
              size: 20,
            ),
            const SizedBox(
              height: 20,
            ),
            const ErrorText(
              text: StringsConfig.notFoundDesc,
              color: Colors.grey,
              size: 20,
            ),
            const SizedBox(
              height: 20,
            ),
            if (isButtonLogin) const OutlinedButtonLoginCustom()
          ],
        ),
      ),
    );
  }
}
