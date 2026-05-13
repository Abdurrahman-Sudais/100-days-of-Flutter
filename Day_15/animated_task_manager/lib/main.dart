import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

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
      theme: ThemeData(
        scaffoldBackgroundColor: Color(0xFFF4F3F8),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
        brightness: Brightness.light,
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
        backgroundColor: Color(0xFF6C5CE7),
        title: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Good evening,",
                style: TextStyle(fontSize: 19.0, color: Colors.white70),
              ),
              Text(
                "Sudais 👋",
                style: TextStyle(fontSize: 30.0, color: Colors.white),
              ),
            ],
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              backgroundColor: Colors.white.withOpacity(0.2),
              radius: 20,
              child: Icon(Icons.person, color: Colors.white, size: 20),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          
          Container(
            color: Color(0xFF6C5CE7),
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
            child: Row(
              children: [
                Expanded(child: _statCard("5", "Total Tasks")),
                SizedBox(width: 8),
                Expanded(child: _statCard("1", "Completed")),
                SizedBox(width: 8),
                Expanded(child: _statCard("4", "Pending")),
              ],
            ),
          ),

          
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Color(0xFFF4F3F8),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(28),
                  topRight: Radius.circular(28),
                ),
              ),
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Today's Progress",
                    style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(height: 8),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(99),
                    child: LinearProgressIndicator(
                      value: 2 / 5,
                      minHeight: 8,
                      backgroundColor: Color(0xFFEDE9FF),
                      valueColor: AlwaysStoppedAnimation<Color>(
                        Color(0xFF6C5CE7),
                      ),
                    ),
                  ),
                  SizedBox(height: 24),

                  
                  Expanded(
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Lottie.asset(
                            'assets/lotties/notask.json',
                            width: 200,
                            height: 200,
                            fit: BoxFit.contain,
                          ),
                          SizedBox(height: 12),
                          Text(
                            "No tasks yet!",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Color(0xFF1a1a2e),
                            ),
                          ),
                          SizedBox(height: 6),
                          Text(
                            "Tap + to add your first task",
                            style: TextStyle(fontSize: 12, color: Colors.grey),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Color(0xFF6C5CE7),
        child: Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}

Widget _statCard(String number, String label) {
  return Card(
    color: Colors.white.withOpacity(0.5),
    child: Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            number,
            style: TextStyle(fontSize: 26, fontWeight: FontWeight.w600),
          ),
          Text(label, style: TextStyle(fontSize: 11)),
        ],
      ),
    ),
  );
}
