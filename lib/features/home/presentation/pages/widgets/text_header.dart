import 'package:flutter/material.dart';

class TextHeader extends StatelessWidget {
  const TextHeader({
    Key? key,
    required this.title,
  }) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 16),
      margin: const EdgeInsets.only(
        top: 10,
        bottom: 10,
      ),
      child: Text(
        title,
        style: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 17),
      ),
    );
  }
}
