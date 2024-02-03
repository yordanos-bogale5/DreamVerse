// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class MeditationScreen extends StatefulWidget {
  const MeditationScreen({Key? key}) : super(key: key);

  @override
  _MeditationScreenState createState() => _MeditationScreenState();
}

class _MeditationScreenState extends State<MeditationScreen> {
  late final AudioPlayer _audioPlayer;

  final List<MeditationCard> _meditationCards = [
    MeditationCard(
      title: 'Deep Relaxation',
      audioUrl: 'assets/audios/deep_relaxation.mp3',
    ),
    MeditationCard(
      title: 'Body Scan',
      audioUrl: 'assets/audios/body_scan.mp3',
    ),
    MeditationCard(
      title: 'Mindfulness of Breath',
      audioUrl: 'assets/audios/mindfulness_of_breath.mp3',
    ),
  ];

  @override
  void initState() {
    super.initState();
    // Initialize the audio player
    _audioPlayer = AudioPlayer();
    // Preload the first meditation audio
    
  }

  @override
  void dispose() {
    // Release the audio player resources
    _audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meditation'),
      ),
      body: ListView.builder(
        itemCount: _meditationCards.length,
        itemBuilder: (context, index) {
          return MeditationCardWidget(
            meditationCard: _meditationCards[index],
            audioPlayer: _audioPlayer,
          );
        },
      ),
    );
  }
}

class MeditationCard {
  final String title;
  final String audioUrl;

  MeditationCard({
    required this.title,
    required this.audioUrl,
  });
}

class MeditationCardWidget extends StatefulWidget {
  final MeditationCard meditationCard;
  final AudioPlayer audioPlayer;

  const MeditationCardWidget({
    Key? key,
    required this.meditationCard,
    required this.audioPlayer,
  }) : super(key: key);

  @override
  _MeditationCardWidgetState createState() => _MeditationCardWidgetState();
}

class _MeditationCardWidgetState extends State<MeditationCardWidget> {
  bool _isPlaying = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(widget.meditationCard.title),
        subtitle: const Text('Tap to play'),
        trailing: IconButton(
          icon: Icon(_isPlaying ? Icons.pause : Icons.play_arrow),
          onPressed: () {
            if (_isPlaying) {
              widget.audioPlayer.pause();
            } else {
              
            }
            setState(() {
              _isPlaying = !_isPlaying;
            });
          },
        ),
      ),
    );
  }
}
