import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:youtube_clone/core/utils/manager/app_dialog_manager.dart';

import '../../features/auth/presentation/pages/login/login_screen.dart';
import '../../features/video_player/presentation/blocs/subscriber_bloc/subscriber_bloc.dart';
import '../../features/video_player/presentation/blocs/subscriber_bloc/subscriber_event.dart';
import '../../features/video_player/presentation/blocs/subscriber_bloc/subscriber_state.dart';
import '../utils/manager/app_color_manager.dart';

class ButtonSubscribe extends StatelessWidget {
  const ButtonSubscribe({
    Key? key,
    required this.fullname,
    required this.userID,
  }) : super(key: key);

  final String fullname;
  final String userID;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SubscriberBloc, SubscriberState>(
      builder: (context, state) {
        if (state is GetStatusSubscriberLoadingState) {
          return const CircularProgressIndicator();
        } else if (state is GetStatusSubscriberSuccessState) {
          return subscriberButton(
            context,
            onClick: () {
              if (state.result.result) {
                showDialogUnsubscribe(context);
              } else {
                context
                    .read<SubscriberBloc>()
                    .add(AddSubscribeEvent(userID: userID));
              }
            },
            color: state.result.result
                ? AppColorManager.greyColor
                : AppColorManager.red,
          );
        } else if (state is GetStatusSubscriberErrorState) {
          return subscriberButton(
            context,
            onClick: () {
              AppDialogManager.showAlertDialog(context, state.error);
            },
            color: AppColorManager.red,
          );
        }
        return const SizedBox.shrink();
      },
    );
  }

  Widget subscriberButton(
    BuildContext context, {
    required void Function()? onClick,
    required Color color,
  }) {
    return TextButton(
      onPressed: onClick,
      style: TextButton.styleFrom(
        foregroundColor: color,
        textStyle:
            Theme.of(context).textTheme.bodyText2!.copyWith(fontSize: 14),
      ),
      child: const Text(
        "Subscribe",
      ),
    );
  }

  void showDialogUnsubscribe(BuildContext context) {
    AppDialogManager.showAlertDialog(
      context,
      "Unsubscribe from $fullname ?",
      button: [
        {
          "text": "Cancel",
          "onClick": () {
            Navigator.pop(context, false);
          },
        },
        {
          "text": "UNSUBSCRIBE",
          "onClick": () {
            Navigator.pop(context, true);
          },
        },
      ],
    ).then((value) {
      if (value) {
        context.read<SubscriberBloc>().add(
              UnSubscribeEvent(
                userID: userID,
              ),
            );
      }
    });
  }
}
