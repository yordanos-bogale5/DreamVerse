
// Import necessary Flutter libraries.
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

// Create a stateless widget for the story video screen.
class StoryVideoScreen extends StatelessWidget {
  // Define the video player controller.
  final VideoPlayerController videoPlayerController;

  // Initialize the video player controller in the constructor.
  const StoryVideoScreen({Key? key, required this.videoPlayerController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Use a FutureBuilder to load the video player.
    return FutureBuilder(
      future: videoPlayerController.initialize(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          // If the video player is initialized, display it.
          return AspectRatio(
            aspectRatio: videoPlayerController.value.aspectRatio,
            child: VideoPlayer(videoPlayerController),
          );
        } else {
          // If the video player is not initialized, display a loading indicator.
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}