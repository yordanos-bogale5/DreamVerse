
import 'package:flutter/material.dart';

// Define the MelodyTaleScreen class
class MelodyTaleScreen extends StatefulWidget {
  const MelodyTaleScreen({Key? key}) : super(key: key);

  @override
  State<MelodyTaleScreen> createState() => _MelodyTaleScreenState();
}

class _MelodyTaleScreenState extends State<MelodyTaleScreen> {
  // Define a list of bedtime stories
  final List<BedtimeStory> stories = [
    BedtimeStory(
        title: 'The Little Engine That Could',
        author: 'Watty Piper',
        imageUrl: 'assets/images/little_engine.jpg'),
    BedtimeStory(
        title: 'Goodnight Moon',
        author: 'Margaret Wise Brown',
        imageUrl: 'assets/images/goodnight_moon.jpg'),
    BedtimeStory(
        title: 'Where the Wild Things Are',
        author: 'Maurice Sendak',
        imageUrl: 'assets/images/where_the_wild_things_are.jpg'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Melody Tale'),
      ),
      body: ListView.builder(
        itemCount: stories.length,
        itemBuilder: (context, index) {
          return BedtimeStoryCard(story: stories[index]);
        },
      ),
    );
  }
}

// Define the BedtimeStory class
class BedtimeStory {
  final String title;
  final String author;
  final String imageUrl;

  BedtimeStory({required this.title, required this.author, required this.imageUrl});
}

// Define the BedtimeStoryCard class
class BedtimeStoryCard extends StatelessWidget {
  final BedtimeStory story;

  const BedtimeStoryCard({Key? key, required this.story}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Image.asset(story.imageUrl),
        title: Text(story.title),
        subtitle: Text(story.author),
        onTap: () {
          // Navigate to the story detail screen
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => StoryDetailScreen(story: story),
            ),
          );
        },
      ),
    );
  }
}

// Define the StoryDetailScreen class
class StoryDetailScreen extends StatelessWidget {
  final BedtimeStory story;

  const StoryDetailScreen({Key? key, required this.story}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(story.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(story.imageUrl),
            Text(story.title),
            Text(story.author),
            
          ],
        ),
      ),
    );
  }
}