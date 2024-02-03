
// ignore_for_file: library_private_types_in_public_api

// Import the necessary libraries.
import 'package:flutter/material.dart';

import 'package:audioplayers/audioplayers.dart';

// Create a new StatefulWidget class for the SoftSleepSoundsScreen.
class SoftSleepSoundsScreen extends StatefulWidget {
  // Define the constructor for the SoftSleepSoundsScreen class.
  const SoftSleepSoundsScreen({Key? key}) : super(key: key);

  // Define the createState method for the SoftSleepSoundsScreen class.
  @override
  _SoftSleepSoundsScreenState createState() => _SoftSleepSoundsScreenState();
}

// Create a new State class for the SoftSleepSoundsScreen.
class _SoftSleepSoundsScreenState extends State<SoftSleepSoundsScreen> {
  // Define the AudioPlayer instance.
  late AudioPlayer _audioPlayer;

  // Define the list of soft sleep sounds.
  final List<String> _softSleepSounds = [
    'assets/audio/soft_sleep_sound_1.mp3',
    'assets/audio/soft_sleep_sound_2.mp3',
    'assets/audio/soft_sleep_sound_3.mp3',
  ];

  // Define the current soft sleep sound index.
  int _currentSoftSleepSoundIndex = 0;

  // Define the isPlaying flag.
  bool _isPlaying = false;

  // Define the initState method for the SoftSleepSoundsScreenState class.
  @override
  void initState() {
    super.initState();

    // Initialize the AudioPlayer instance.
    _audioPlayer = AudioPlayer();

    // Set the audio player mode to STAY_AWAKE.

    // Load the first soft sleep sound.
    _loadSoftSleepSound(_softSleepSounds[_currentSoftSleepSoundIndex]);
  }

  // Define the dispose method for the SoftSleepSoundsScreenState class.
  @override
  void dispose() {
    super.dispose();

    // Dispose the AudioPlayer instance.
    _audioPlayer.dispose();
  }

  // Define the _loadSoftSleepSound method.
  void _loadSoftSleepSound(String path) {
    // Load the soft sleep sound from the assets directory.
    
  }

  // Define the _playSoftSleepSound method.
  void _playSoftSleepSound() {
    // Play the soft sleep sound.
    _audioPlayer.play(AssetSource(_softSleepSounds[_currentSoftSleepSoundIndex]));

    // Set the isPlaying flag to true.
    _isPlaying = true;
  }

  // Define the _pauseSoftSleepSound method.
  void _pauseSoftSleepSound() {
    // Pause the soft sleep sound.
    _audioPlayer.pause();

    // Set the isPlaying flag to false.
    _isPlaying = false;
  }

  // Define the _stopSoftSleepSound method.
  void _stopSoftSleepSound() {
    // Stop the soft sleep sound.
    _audioPlayer.stop();

    // Set the isPlaying flag to false.
    _isPlaying = false;
  }

  // Define the _nextSoftSleepSound method.
  void _nextSoftSleepSound() {
    // Increment the current soft sleep sound index.
    _currentSoftSleepSoundIndex++;

    // If the current soft sleep sound index is greater than or equal to the length of the list of soft sleep sounds,
    // set the current soft sleep sound index to 0.
    if (_currentSoftSleepSoundIndex >= _softSleepSounds.length) {
      _currentSoftSleepSoundIndex = 0;
    }

    // Load the next soft sleep sound.
    _loadSoftSleepSound(_softSleepSounds[_currentSoftSleepSoundIndex]);

    // Play the next soft sleep sound.
    _playSoftSleepSound();
  }

  // Define the _previousSoftSleepSound method.
  void _previousSoftSleepSound() {
    // Decrement the current soft sleep sound index.
    _currentSoftSleepSoundIndex--;

    // If the current soft sleep sound index is less than 0,
    // set the current soft sleep sound index to the length of the list of soft sleep sounds - 1.
    if (_currentSoftSleepSoundIndex < 0) {
      _currentSoftSleepSoundIndex = _softSleepSounds.length - 1;
    }

    // Load the previous soft sleep sound.
    _loadSoftSleepSound(_softSleepSounds[_currentSoftSleepSoundIndex]);

    // Play the previous soft sleep sound.
    _playSoftSleepSound();
  }

  // Define the _buildBody method.
  Widget _buildBody() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Soft Sleep Sounds',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),
          Image.asset(
            'assets/images/soft_sleep_sounds.png',
            width: 200,
            height: 200,
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: _previousSoftSleepSound,
                icon: const Icon(Icons.skip_previous),
              ),
              const SizedBox(width: 20),
              _isPlaying
                  ? IconButton(
                onPressed: _pauseSoftSleepSound,
                icon: const Icon(Icons.pause),
              )
                  : IconButton(
                onPressed: _playSoftSleepSound,
                icon: const Icon(Icons.play_arrow),
              ),
              const SizedBox(width: 20),
              IconButton(
                onPressed: _nextSoftSleepSound,
                icon: const Icon(Icons.skip_next),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // Define the build method for the SoftSleepSoundsScreenState class.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Soft Sleep Sounds'),
      ),
      body: _buildBody(),
    );
  }
}