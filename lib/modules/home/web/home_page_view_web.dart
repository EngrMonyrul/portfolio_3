import 'dart:ui';
import 'package:animate_do/animate_do.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/modules/home/web/widgets/calendar_widget.dart';
import 'package:portfolio/modules/home/web/widgets/clock_widget.dart';
import '../../../controllers/constants/constants.dart';

class HomePageWebView extends StatefulWidget {
  const HomePageWebView({super.key});

  @override
  State<HomePageWebView> createState() => _HomePageWebViewState();
}

class _HomePageWebViewState extends State<HomePageWebView> {
  int colorIndex = 0;

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(bgImg),
          fit: BoxFit.fill,
        ),
      ),
      child: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            SizedBox(
              height: screenSize.height * 0.6,
              width: screenSize.width * 0.4,
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaY: 5, sigmaX: 5),
                child: SizedBox(
                  height: screenSize.height * 0.6,
                  width: screenSize.width * 0.4,
                ),
              ),
            ),
            FadeIn(
              child: Container(
                height: screenSize.height * 0.6,
                width: screenSize.width * 0.4,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.7),
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                ),
                child: Column(
                  children: [
                    SlideInUp(
                      child: SizedBox(
                        height: screenSize.height * 0.15,
                        width: screenSize.width * 0.4,
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
                      height: screenSize.height * 0.33,
                      width: screenSize.width * 0.2,
                      margin: const EdgeInsets.symmetric(vertical: 3),
                      child: CarouselSlider(
                        options: CarouselOptions(
                          viewportFraction: 1,
                          autoPlay: true,
                          scrollPhysics: const BouncingScrollPhysics(),
                          enableInfiniteScroll: true,
                          animateToClosest: true,
                          enlargeCenterPage: true,
                        ),
                        items: SliderWidgets.map((e){
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
      ),
    );
  }
}
