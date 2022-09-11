import 'package:flutter/material.dart';

class OutLineButtonSearch extends StatelessWidget {
  const OutLineButtonSearch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: OutlinedButton(
        onPressed: () {},
        child: const Icon(Icons.search),
      ),
    );
  }
}
