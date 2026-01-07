import 'package:flutter/material.dart';

class ResponsiveLayoutScreen extends StatelessWidget {
  const ResponsiveLayoutScreen({
    super.key,
    required this.webScreenLayout,
    required this.mobileScreenLayout,
  });
  final Widget webScreenLayout;
  final Widget mobileScreenLayout;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, Constraints) {
        if (Constraints.maxWidth > 600) {
          return webScreenLayout;
        }
        return mobileScreenLayout;
      },
    );
  }
}
