import 'package:flutter/material.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'detail_story_page.dart';

class NewFe extends StatelessWidget {
  const NewFe({super.key });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Your App Title',
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.blueGrey,
        scaffoldBackgroundColor: Colors.transparent,
        textTheme: const TextTheme(
          bodyMedium: TextStyle(color: Colors.black),
        ),
        colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.yellow[900]),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.blueGrey,
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          selectedItemColor: Colors.blueGrey,
          unselectedItemColor: Colors.grey,
        ),
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.black,
        scaffoldBackgroundColor: Colors.black,
        textTheme: const TextTheme(
          bodyMedium: TextStyle(color: Colors.transparent),
        ),
        colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.yellow[900]),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.black,
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.grey,
        ),
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  bool isDarkMode = false;

  final List<Story> stories = [
    Story(title: 'Stories 1', imageAsset: 'assets/maxresdefault.jpg'),
    Story(title: 'Calm Meditation', imageAsset: 'assets/1517213245.banner.BK-Why-Meditation.jpg'),
    Story(title: 'Melodic Tales', imageAsset: 'assets/telling-tales.jpg'),
    Story(title: 'Soft Sleep Sounds', imageAsset: 'assets/maxresdefault (1).jpg'),
    Story(title: 'Calm Meditation', imageAsset: 'assets/1517213245.banner.BK-Why-Meditation.jpg'),
    Story(title: 'Melodic Tales', imageAsset: 'assets/telling-tales.jpg'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(
              Icons.music_note,
              color: Colors.pink,
              size: 28.0,
            ),
            onPressed: () {
              // Add functionality for the music icon if needed
            },
          ),
          IconButton(
            icon: Icon(
              isDarkMode ? Icons.light_mode : Icons.dark_mode,
              color: Colors.pink[900],
            ),
            onPressed: () {
              setState(() {
                isDarkMode = !isDarkMode;
              });
            },
          ),
        ],
      ),
      body: AnimatedContainer(
        duration: const Duration(seconds: 1),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              isDarkMode ? Colors.black : Colors.blue,
              isDarkMode ? Colors.black : Colors.white,
            ],
          ),
        ),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 8.0,
            mainAxisSpacing: 8.0,
          ),
          itemCount: stories.length,
          itemBuilder: (context, index) {
            return StoryCardWithPhoto(
              story: stories[index],
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const DetailStoryScreen(stories: []),
                  ),
                );
                setState(() {
                  _selectedIndex = index;
                });
              },
            );
          },
        ),
      ),
      bottomNavigationBar: ConvexAppBar(
        backgroundColor: Colors.pink[900],
        elevation: 0,
        style: TabStyle.reactCircle,
        items: const [
          TabItem(icon: Icons.home, title: 'Home'),
          TabItem(icon: Icons.library_books, title: 'My Library'),
          TabItem(icon: Icons.settings, title: 'Settings'),
        ],
        initialActiveIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
          // Add navigation logic if needed
        },
      ),
    );
  }
}

class Story {
  final String title;
  final String imageAsset;

  Story({required this.title, required this.imageAsset});
}

class StoryCardWithPhoto extends StatelessWidget {
  final Story story;
  final VoidCallback onTap;

  const StoryCardWithPhoto({
    Key? key,
    required this.story,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: onTap,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.asset(
                  story.imageAsset,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                story.title,
                style: const TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
