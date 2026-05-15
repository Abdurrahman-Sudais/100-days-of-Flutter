import 'package:flutter/material.dart';
import 'package:mini_social_media_app/notifications.dart';
import 'package:mini_social_media_app/post.dart';
import 'package:mini_social_media_app/profile_page.dart';
import 'package:mini_social_media_app/home_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Social Media App",
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
        scaffoldBackgroundColor: Colors.white,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Campulse", style: TextStyle(fontWeight: FontWeight.w600)),
        actions: [
          Padding(
            padding: EdgeInsetsGeometry.symmetric(horizontal: 20),
            child: Row(
              children: [
                Icon(Icons.search),
                SizedBox(width: 30),
                Icon(Icons.send_outlined),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: SizedBox(
        height: 60,
        child: NavigationBar(
          selectedIndex: currentIndex,
          onDestinationSelected: (value) {
            setState(() {
              currentIndex = value;
            });
          },
          backgroundColor: Colors.white10,
          destinations: [
            NavigationDestination(icon: Icon(Icons.home), label: "Home"),
            NavigationDestination(
              icon: Icon(Icons.notifications_active),
              label: "Notification",
            ),
            NavigationDestination(icon: Icon(Icons.add), label: "Post"),
            NavigationDestination(icon: Icon(Icons.person), label: "Profile"),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text("Post added!"),
              duration: Duration(seconds: 1),
              behavior: SnackBarBehavior.fixed,
            ),
          );
        },
        backgroundColor: Colors.blueGrey.withOpacity(1),
        child: Icon(Icons.add),
      ),
      body: IndexedStack(
        index: currentIndex,
        children: [HomePage1(), Notifications(), Post(), ProfilePage()],
      ),
    );
  }
}
