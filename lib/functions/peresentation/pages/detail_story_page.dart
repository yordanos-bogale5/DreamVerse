import 'package:flutter/material.dart';

class DetailStoryScreen extends StatelessWidget {
  final List<Story> stories;

  const DetailStoryScreen({Key? key, required this.stories}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stories'),
      ),
      body: ListView.builder(
        itemCount: stories.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              title: Text(stories[index].title),
            ),
          );
        },
      ),
    );
  }
}

class Story {
  final String title;

  const Story({
    required this.title,
  });
}

void main() {
  runApp(
    const MaterialApp(
      home: DetailStoryScreen(
        stories: [
          Story(title: 'The Adventure Begins'),
          Story(title: 'Mystery in the Woods'),
          Story(title: 'The Magical Castle'),
          Story(title: 'Lost in Time'),
          Story(title: 'A Tale of Friendship'),
          Story(title: 'The legacy'),
        ],
      ),
    ),
  );
}
