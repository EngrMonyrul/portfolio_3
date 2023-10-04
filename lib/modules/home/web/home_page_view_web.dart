// ignore_for_file: use_build_context_synchronously

import 'dart:async';
import 'dart:ui';
import 'dart:math' as math;
import 'package:animate_do/animate_do.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio/modules/home/web/widgets/calendar_widget.dart';
import 'package:portfolio/modules/home/web/widgets/clock_widget.dart';
import 'package:video_player/video_player.dart';
import '../../../controllers/constants/constants.dart';

class HomePageWebView extends StatefulWidget {
  const HomePageWebView({super.key});

  @override
  State<HomePageWebView> createState() => _HomePageWebViewState();
}

class _HomePageWebViewState extends State<HomePageWebView> {
  int colorIndex = 0;
  VideoPlayerController? videoPlayerController;

  setVideoController() async {
    videoPlayerController = VideoPlayerController.networkUrl(
      Uri.parse(
          'https://player.vimeo.com/external/438748023.sd.mp4?s=ced561755a3a110eec902e745d271fde73ab0bb2&profile_id=164&oauth2_token_id=57447761'),
    );
    await videoPlayerController!.initialize();
    await videoPlayerController!.play();
    await videoPlayerController!.setLooping(true);
  }

  @override
  void initState() {
    setVideoController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        alignment: Alignment.center,
        children: [
          Transform.scale(
            scale: 1.2,
            child: SizedBox(
              height: double.infinity,
              width: double.infinity,
                child:
                    videoPlayerController!.value.isInitialized ? VideoPlayer(videoPlayerController!) : SizedBox()),
          ),
          SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaY: 5, sigmaX: 5),
              child: const SizedBox(
                height: double.infinity,
                width: double.infinity,
              ),
            ),
          ),
          FadeIn(
            child: Container(
              height: 500,
              width: 500,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.7),
                borderRadius: const BorderRadius.all(Radius.circular(10)),
              ),
              child: Column(
                children: [
                  SlideInUp(
                    child: SizedBox(
                      height: 100,
                      width: 500,
                      child: Column(
                        children: [
                          const Text(
                            ownerName,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 50,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          AnimatedTextKit(
                            repeatForever: true,
                            isRepeatingAnimation: true,
                            onNextBeforePause: (_, __) {
                              setState(() {
                                if (colorIndex == animatedTextColors.length - 1) {
                                  colorIndex = 0;
                                } else {
                                  colorIndex++;
                                }
                              });
                            },
                            animatedTexts: animatedText.map((e) {
                              return FadeAnimatedText(
                                e,
                                duration: const Duration(seconds: 5),
                                textStyle: TextStyle(
                                  color: animatedTextColors[colorIndex],
                                ),
                              );
                            }).toList(),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: 300,
                    width: 500,
                    alignment: Alignment.center,
                    child: CarouselSlider(
                      options: CarouselOptions(
                        viewportFraction: 1,
                        autoPlay: true,
                        scrollPhysics: const BouncingScrollPhysics(),
                        enableInfiniteScroll: true,
                        animateToClosest: true,
                        enlargeCenterPage: true,
                      ),
                      items: SliderWidgets.map((e) {
                        return e;
                      }).toList(),
                    ),
                  ),
                  const Spacer(),
                  FadeIn(
                    duration: const Duration(seconds: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: pageButtons.map((e) {
                        return Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                          margin: const EdgeInsets.symmetric(horizontal: 3),
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.all(Radius.circular(5)),
                            border: Border.all(color: Colors.black),
                          ),
                          child: Text(
                            e,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              color: Colors.black,
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
