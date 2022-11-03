// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:youtube_clone/core/utils/manager/app_color_manager.dart';

class BottomSheetCustom extends StatelessWidget {
  const BottomSheetCustom({
    Key? key,
    required this.child,
    required this.text,
    required this.height,
  }) : super(key: key);

  final Widget child;
  final String text;
  final double height;
  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxHeight: height,
      ),
      child: SizedBox(
        height: height,
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Container(
                height: 5,
                width: 40,
                decoration: const BoxDecoration(
                    color: AppColorManager.greyColor,
                    borderRadius: BorderRadius.horizontal(
                      left: Radius.circular(15),
                      right: Radius.circular(15),
                    )),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.close,
                    ),
                  ),
                  Text(
                    text,
                    style: Theme.of(context).textTheme.bodyText1,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                ],
              ),
              const Divider(
                height: 2,
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                height: height - 81,
                child: child,
              )
            ],
          ),
        ),
      ),
    );
  }
}
