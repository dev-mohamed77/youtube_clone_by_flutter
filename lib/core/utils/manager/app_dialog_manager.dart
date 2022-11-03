import 'package:flutter/material.dart';

class AppDialogManager {
  static Future showAlertDialog(
    BuildContext ctx,
    String title, {
    String? content,
    List<Map<String, dynamic>>? button,
  }) {
    return showDialog(
        context: ctx,
        builder: (ctx) {
          return AlertDialog(
            title: Text(
              title,
              style: Theme.of(ctx).textTheme.bodyMedium,
            ),
            content: content != null
                ? Text(
                    content,
                    style: Theme.of(ctx).textTheme.bodyMedium,
                  )
                : null,
            actions: button?.map((e) {
              return TextButton(
                onPressed: e["onClick"],
                child: Text(e["text"]),
              );
            }).toList(),
          );
        });
  }

  static void showBottomSheetApp(
    BuildContext ctx,
    Widget child,
  ) {
    showBottomSheet(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(30),
        ),
      ),
      backgroundColor: Theme.of(ctx).scaffoldBackgroundColor,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      context: ctx,
      builder: (ctx) {
        return child;
      },
    );
  }

  static void showModalBottomSheetApp(
    BuildContext ctx,
    Widget child,
  ) {
    showModalBottomSheet(
      context: ctx,
      builder: (context) {
        return child;
      },
    );
  }
}
