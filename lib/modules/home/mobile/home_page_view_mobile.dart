import 'package:flutter/material.dart';
import 'package:portfolio/controllers/common/responsive_builder_widget.dart';

class HomePageMobileView extends StatelessWidget {
  const HomePageMobileView({super.key});

  @override
  Widget build(BuildContext context) {
    return const ResponsiveBuilder(
      mobileView: SizedBox(),
    );
  }
}
