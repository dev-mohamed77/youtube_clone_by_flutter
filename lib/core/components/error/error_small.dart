import 'package:flutter/material.dart';
import 'package:youtube_clone/core/components/error_image_handle.dart';
import 'package:youtube_clone/core/components/error_text.dart';

import '../outline_button_login_custom.dart';

class NotFoundScreenSmall extends StatelessWidget {
  const NotFoundScreenSmall(
      {Key? key,
      required this.pathImage,
      required this.title,
      required this.description,
      required this.isButtonLogin})
      : super(key: key);

  final String? pathImage;
  final String title;
  final String description;
  final bool isButtonLogin;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ErrorImageHandle(
            pathImage: pathImage,
          ),
          const SizedBox(
            height: 20,
          ),
          ErrorText(
            text: title,
            bold: true,
          ),
          const SizedBox(
            height: 20,
          ),
          ErrorText(
            text: description,
            color: Colors.grey,
          ),
          const SizedBox(
            height: 20,
          ),
          if (isButtonLogin) const OutlinedButtonLoginCustom()
        ],
      ),
    );
  }
}
