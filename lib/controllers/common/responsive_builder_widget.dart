import 'package:flutter/material.dart';

class ResponsiveBuilder extends StatelessWidget {
  final Widget? mobileView;
  final Widget? webView;
  const ResponsiveBuilder({super.key, this.mobileView, this.webView});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < 600) {
          return mobileView!;
        } else {
          return webView!;
        }
      },
    );
  }
}
