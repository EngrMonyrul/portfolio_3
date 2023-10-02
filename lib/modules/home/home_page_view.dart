import 'package:flutter/material.dart';
import 'package:portfolio/controllers/common/responsive_builder_widget.dart';
import 'package:portfolio/modules/home/web/home_page_view_web.dart';

class HomePageView extends StatelessWidget {
  const HomePageView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: ResponsiveBuilder(
        webView: HomePageWebView(),
      ),
    );
  }
}
