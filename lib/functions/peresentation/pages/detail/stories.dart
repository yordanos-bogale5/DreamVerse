
import 'package:flutter/material.dart';

class StoryScreen extends StatelessWidget {
  final List<StoryType> storyTypes;

  const StoryScreen({Key? key, required this.storyTypes}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bedtime Stories'),
      ),
      body: ListView.builder(
        itemCount: storyTypes.length,
        itemBuilder: (context, index) {
          return StoryCard(storyType: storyTypes[index]);
        },
      ),
    );
  }
}

class StoryCard extends StatelessWidget {
  final StoryType storyType;

  const StoryCard({Key? key, required this.storyType}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(storyType.name),
        subtitle: Text(storyType.description),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => StoryDetailScreen(storyType: storyType),
            ),
          );
        },
      ),
    );
  }
}

class StoryType {
  final String name;
  final String description;

  const StoryType({required this.name, required this.description});
}

class StoryDetailScreen extends StatelessWidget {
  final StoryType storyType;

  const StoryDetailScreen({Key? key, required this.storyType}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(storyType.name),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(storyType.description),
        ),
      ),
    );
  }
}