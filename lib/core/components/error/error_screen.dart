import 'package:flutter/material.dart';
import 'package:youtube_clone/core/components/responsive.dart';
import 'error_large.dart';
import 'error_small.dart';

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({
    Key? key,
    this.pathImage,
    required this.title,
    required this.description,
    bool? isButtonLogin,
  })  : _isButtonLogin = isButtonLogin ?? false,
        super(key: key);

  final String? pathImage;
  final String title;
  final String description;
  final bool _isButtonLogin;

  @override
  Widget build(BuildContext context) {
    return Responsive(
      mobile: NotFoundScreenSmall(
        title: title,
        description: description,
        pathImage: pathImage,
        isButtonLogin: _isButtonLogin,
      ),
      desktop: ErrorScreenLarge(
        title: title,
        description: description,
        pathImage: pathImage,
        isButtonLogin: _isButtonLogin,
      ),
    );
  }
}
