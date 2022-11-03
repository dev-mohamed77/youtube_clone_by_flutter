// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class ProfileCover extends StatelessWidget {
  const ProfileCover({
    Key? key,
    required this.text,
  }) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      color: Colors.blueAccent,
      alignment: Alignment.center,
      width: MediaQuery.of(context).size.width,
      child: CircleAvatar(
        foregroundColor: Colors.amber,
        maxRadius: 80,
        child: Text(
          text,
          overflow: TextOverflow.ellipsis,
          style: Theme.of(context).textTheme.headline1,
        ),
      ),
    );
  }
}
