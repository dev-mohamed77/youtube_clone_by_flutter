import 'package:flutter/material.dart';

class SubscriberButtonDeskTop extends StatelessWidget {
  const SubscriberButtonDeskTop({
    Key? key,
    required this.onClick,
  }) : super(key: key);

  final void Function() onClick;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClick,
      child: Material(
        color: const Color.fromARGB(255, 228, 20, 5),
        child: Container(
          width: 120,
          height: 40,
          alignment: Alignment.center,
          child: Text(
            "SUBSCRIBE",
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.caption,
          ),
        ),
      ),
    );
  }
}
