// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:chewie/chewie.dart';
import 'package:video_player/video_player.dart';

class StoryVideoScreen extends StatelessWidget {
  final String videoUrl;

  const StoryVideoScreen({Key? key, required this.videoUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Chewie(
          controller: ChewieController(
            videoPlayerController: VideoPlayerController.network(videoUrl),
            autoPlay: true,
            looping: false,
            allowFullScreen: false,
          ),
        ),
      ),
    );
  }
}
