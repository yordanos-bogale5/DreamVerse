// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'home_screen.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();

  final List<OnboardingItem> onboardingItems = [
    OnboardingItem(
      title: "Welcome to Bedtime Stories",
      description: "Explore a world of enchanting stories to help you relax and unwind.",
      imagePath: "assets/splash 2.jpg",
    ),
    OnboardingItem(
      title: "Discover Beautiful Narrations",
      description: "Listen to captivating bedtime stories narrated by soothing voices.",
      imagePath: "assets/splash 3.jpg",
    ),
    OnboardingItem(
      title: "Create Your Storytime Playlist",
      description: "Build your personalized playlist for a peaceful night's sleep.",
      imagePath: "assets/splash.jpg",
      showGetStartedButton: true,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            controller: _pageController,
            itemCount: onboardingItems.length,
            onPageChanged: (int page) {


            },
            itemBuilder: (BuildContext context, int index) {
              return Stack(
                children: [
                  Image.asset(
                    onboardingItems[index].imagePath,
                    width: double.infinity,
                    height: double.infinity,
                    fit: BoxFit.cover,
                  ),
                  Positioned(
                    top: 100.0,
                    left: 16.0,
                    right: 16.0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          onboardingItems[index].title,
                          style: const TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold, color: Colors.white),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 16.0),
                        Text(
                          onboardingItems[index].description,
                          style: const TextStyle(fontSize: 20.0, color: Colors.white),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                  if (onboardingItems[index].showGetStartedButton ?? false)
                    Positioned(
                      bottom: 50.0,
                      left: 16.0,
                      right: 16.0,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const HomeScreen()),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.all(20.0), backgroundColor: Colors.orange,
                        ),
                        child: const Text(
                          "Get Started",
                          style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                ],
              );
            },
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top:400 , bottom: 16.0),
              child: SmoothPageIndicator(
                controller: _pageController,
                count: onboardingItems.length,
                effect: const WormEffect(
                  dotHeight: 20,
                  dotWidth: 20,
                  dotColor: Colors.grey,
                  activeDotColor: Colors.orange,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class OnboardingItem {
  final String title;
  final String description;
  final String imagePath;
  final bool? showGetStartedButton;

  OnboardingItem({
    required this.title,
    required this.description,
    required this.imagePath,
    this.showGetStartedButton,
  });
}
