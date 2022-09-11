import 'package:flutter/material.dart';

import '../../../../../core/components/outline_button_login_custom.dart';

class HeaderLogin extends StatelessWidget {
  const HeaderLogin({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        informationText(context, "Sign in to like videos,"),
        informationText(context, "comment, and subscribe,"),
        const SizedBox(
          height: 12,
        ),
        const OutlinedButtonLoginCustom(),
      ],
    );
  }

  Text informationText(BuildContext context, String title) {
    return Text(
      title,
      style: Theme.of(context)
          .textTheme
          .bodyText2!
          .copyWith(fontSize: 15, height: 2),
    );
  }
}
