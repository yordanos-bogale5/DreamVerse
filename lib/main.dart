import 'package:bed_time_story/functions/peresentation/pages/home_screen.dart';
import 'package:flutter/material.dart';

class BedTimeStoryApp extends StatelessWidget {
  const BedTimeStoryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bed Time Story',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
    );
  }
}

