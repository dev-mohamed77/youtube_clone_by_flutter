import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SvgCustom extends StatelessWidget {
  const SvgCustom({
    Key? key,
    required this.path,
    double? size,
  })  : _size = size ?? 300,
        super(key: key);
  final String path;
  final double _size;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      child: SvgPicture.asset(
        path,
        width: _size,
      ),
    );
  }
}
