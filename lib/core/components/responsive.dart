import 'package:flutter/material.dart';

class Responsive extends StatelessWidget {
  const Responsive({
    Key? key,
    required this.mobile,
    this.tablet,
    required this.desktop,
  }) : super(key: key);

  final Widget mobile;
  final Widget? tablet;
  final Widget desktop;

  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= 950;

  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width >= 600 &&
      MediaQuery.of(context).size.width <= 950;

  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width <= 600;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth >= 950) {
          return OrientationBuilder(builder: ((context, orientation) {
            if (orientation == Orientation.landscape) {}
            return desktop;
          }));
        } else if (constraints.maxWidth >= 600 && tablet != null) {
          return OrientationBuilder(
            builder: ((context, orientation) {
              if (orientation == Orientation.landscape) {}

              return tablet!;
            }),
          );
        } else {
          return OrientationBuilder(
            builder: (context, orientation) {
              if (orientation == Orientation.landscape) {}
              return mobile;
            },
          );
        }
      },
    );
  }
}
