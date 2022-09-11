import 'package:flutter/material.dart';

class ErrorText extends StatelessWidget {
  const ErrorText(
      {Key? key, required this.text, Color? color, double? size, bool? bold})
      : _color = color ?? Colors.black,
        _size = size ?? 17,
        _bold = bold ?? false,
        super(key: key);

  final String text;
  final Color _color;
  final double _size;
  final bool _bold;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontWeight: _bold ? FontWeight.bold : null,
        fontSize: _size,
        color: _color,
      ),
    );
  }
}
