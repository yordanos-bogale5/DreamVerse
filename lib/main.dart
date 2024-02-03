
import 'package:bed_time_story/functions/peresentation/pages/splash.dart';
import 'package:flutter/material.dart';
void main() {

runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Bed Time Story',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const OnboardingScreen (),
    );
  }
}

