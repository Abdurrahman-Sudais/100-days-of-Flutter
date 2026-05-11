import 'package:flutter/material.dart';
import 'package:flutter_application_2/pages/calls.dart';
import 'package:flutter_application_2/pages/chats.dart';
import 'package:flutter_application_2/pages/communities.dart';
import 'package:flutter_application_2/pages/updates.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "WhatsApp Clone",
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.black,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.black,
          brightness: Brightness.dark,
        ),
      ),
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentState = 0;
  bool ishome = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("WhatsApp", style: TextStyle(fontSize: 30)),
        centerTitle: false,
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.camera_alt_outlined)),
          IconButton(onPressed: () {}, icon: Icon(Icons.more_vert)),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xFF25D366),
        onPressed: () {},
        child: Icon(Icons.add_comment_rounded, color: Colors.black),
      ),

      bottomNavigationBar: NavigationBar(
        indicatorColor: Color.fromARGB(255, 34, 54, 41),
        selectedIndex: currentState,
        onDestinationSelected: (value) {
          setState(() {
            currentState = value;
          });
        },
        backgroundColor: Colors.black87,
        destinations: [
          NavigationDestination(icon: Icon(Icons.message), label: "Chats"),
          NavigationDestination(icon: Icon(Icons.update), label: "Updates"),
          NavigationDestination(
            icon: Icon(Icons.groups_2_outlined),
            label: "Communities",
          ),
          NavigationDestination(icon: Icon(Icons.call), label: "Calls"),
        ],
      ),
      body: IndexedStack(
        index: currentState,
        children: [Chats(), Updates(), Communities(), Calls()],
      ),
    );
  }
}
