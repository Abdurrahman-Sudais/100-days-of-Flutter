import 'package:flutter/material.dart';

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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Divider(),
            SizedBox(
              height: 100,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Padding(
                  padding: const EdgeInsets.only(left: 25.0),
                  child: Row(
                    children: [
                      _avatar("G", "Gojo"),
                      SizedBox(width: 30),
                      _avatar("S", "Sudais"),
                      SizedBox(width: 30),
                      _avatar("Q", "Quadratic"),
                      SizedBox(width: 30),
                      _avatar("M", "Michael Joe"),
                      SizedBox(width: 30),
                      _avatar("A", "Awwal"),
                      SizedBox(width: 30),
                      _avatar("Y", "Yahya"),
                      SizedBox(width: 30),
                      _avatar("M", "Mujeeb"),
                      SizedBox(width: 30),
                      _avatar("A", "Ali"),
                    ],
                  ),
                ),
              ),
            ),
            Divider(),
            Padding(
              padding: EdgeInsetsGeometry.symmetric(horizontal: 8.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    ListTile(
                      leading: CircleAvatar(child: Text("S")),
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Sudais",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text("2h ago", style: TextStyle(fontSize: 10)),
                        ],
                      ),
                      isThreeLine: true,
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 10),
                          Text(
                            "100 days of code update: Day 16 done. Feeling unstoppable!!!",
                          ),
                          SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Icon(Icons.favorite_border, size: 16),
                                  SizedBox(width: 30),
                                  Icon(Icons.comment, size: 16),
                                  SizedBox(width: 30),
                                  Icon(Icons.share, size: 16),
                                ],
                              ),
                              Icon(Icons.bookmark_border, size: 16),
                            ],
                          ),
                          SizedBox(height: 8),
                          Divider(),
                        ],
                      ),
                    ),
                    ListTile(
                      leading: CircleAvatar(child: Text("Q")),
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Quadratic",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text("11h ago", style: TextStyle(fontSize: 10)),
                        ],
                      ),
                      isThreeLine: true,
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 10),
                          ClipRRect(
                            borderRadius: BorderRadiusGeometry.circular(25),
                            child: Image.network(
                              "https://images.unsplash.com/photo-1617531653332-bd46c24f2068?auto=format&fit=crop&q=80&w=1000",
                              fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Icon(Icons.favorite_border, size: 16),
                                  SizedBox(width: 30),
                                  Icon(Icons.comment, size: 16),
                                  SizedBox(width: 30),
                                  Icon(Icons.share, size: 16),
                                ],
                              ),
                              Icon(Icons.bookmark_border, size: 16),
                            ],
                          ),
                          SizedBox(height: 8),
                          Divider(),
                        ],
                      ),
                    ),
                    ListTile(
                      leading: CircleAvatar(child: Text("A")),
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Aisha",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text("2h ago", style: TextStyle(fontSize: 10)),
                        ],
                      ),
                      isThreeLine: true,
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 10),
                          ClipRRect(
                            borderRadius: BorderRadiusGeometry.circular(25),
                            child: Image.network(
                              "https://images.unsplash.com/photo-1617531653332-bd46c24f2068?auto=format&fit=crop&q=80&w=1000",
                              fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Icon(Icons.favorite_border, size: 16),
                                  SizedBox(width: 30),
                                  Icon(Icons.comment, size: 16),
                                  SizedBox(width: 30),
                                  Icon(Icons.share, size: 16),
                                ],
                              ),
                              Icon(Icons.bookmark_border, size: 16),
                            ],
                          ),
                          SizedBox(height: 8),
                          Divider(),
                        ],
                      ),
                    ),
                    ListTile(
                      leading: CircleAvatar(child: Text("M")),
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Michael Joe",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text("2h ago", style: TextStyle(fontSize: 10)),
                        ],
                      ),
                      isThreeLine: true,
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 10),
                          Text("Hello world"),
                          SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Icon(Icons.favorite_border, size: 16),
                                  SizedBox(width: 30),
                                  Icon(Icons.comment, size: 16),
                                  SizedBox(width: 30),
                                  Icon(Icons.share, size: 16),
                                ],
                              ),
                              Icon(Icons.bookmark_border, size: 16),
                            ],
                          ),
                          SizedBox(height: 8),
                          Divider(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget _avatar(String letter, String name) {
  return Column(
    children: [
      CircleAvatar(radius: 30, child: Text(letter)),
      SizedBox(height: 10),
      Text(name),
    ],
  );
}
