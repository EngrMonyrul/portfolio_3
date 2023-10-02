// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';

class HomePageWebView extends StatefulWidget {
  const HomePageWebView({super.key});

  @override
  State<HomePageWebView> createState() => _HomePageWebViewState();
}

class _HomePageWebViewState extends State<HomePageWebView> {
  VideoPlayerController? videoPlayerController;
  ChewieController? chewieController;

  Future<VideoPlayerController> setVideoPlayerController() async {
    try {
      videoPlayerController = VideoPlayerController.networkUrl(
        Uri.parse(
            'https://player.vimeo.com/external/224889044.sd.mp4?s=592944e98c732eb867d56e9b4940d9ed78bbe0ea&profile_id=164&oauth2_token_id=57447761'),
      );

      await videoPlayerController!.initialize();
      await videoPlayerController!.play();

      return videoPlayerController!;
    } catch (e) {
      print(e.toString());

      return videoPlayerController!;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      FutureBuilder<VideoPlayerController>(
        future: setVideoPlayerController(),
        builder: (context, AsyncSnapshot<VideoPlayerController> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return const Center(
              child: Text(
                'Something Went Wrong',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 30,
                ),
              ),
            );
          } else {
            return Center(
              child: SizedBox(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Transform.scale(
                  scale: 2.2,
                  child: VideoPlayer(snapshot.data!),
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
