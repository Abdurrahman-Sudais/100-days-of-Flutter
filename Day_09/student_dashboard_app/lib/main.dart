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
      title: "Student Dashboard",
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blueAccent,
          brightness: Brightness.dark,
        ),
      ),
      home: MyApp(),
    );
  }
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 119, 129, 129),
        title: Text(
          'Student Dashboard',
          style: TextStyle(
            color: Colors.black,
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text("Assignment Added!"),
              duration: Duration(seconds: 0, milliseconds: 500),
            ),
          );
        },
        child: Icon(Icons.add),
      ),
      body: IndexedStack(
        index: currentIndex,
        children: [HomePage(), AssignmentsPage(), ProfilePage()],
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: currentIndex,
        onDestinationSelected: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        destinations: [
          NavigationDestination(icon: Icon(Icons.home), label: "Home"),
          NavigationDestination(icon: Icon(Icons.book), label: "Assignments"),
          NavigationDestination(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          SizedBox(height: 50),
          Text(
            "Welcome, Abdurrahman!",
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20),
          Text(
            "Here's your dashboard overview.",
            style: TextStyle(fontSize: 20, color: Colors.grey),
          ),
          SizedBox(height: 40),
          CircleAvatar(
            radius: 50,
            backgroundImage: NetworkImage(
              "https://images.unsplash.com/photo-1617531653332-bd46c24f2068?auto=format&fit=crop&q=80&w=1000",
            ),
          ),
          SizedBox(height: 30),
          Container(
            margin: EdgeInsets.symmetric(vertical: 20),
            padding: EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 152, 241, 241),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(
              "You have 3 upcoming assignments.",
              style: TextStyle(fontSize: 18, color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }
}

class AssignmentsPage extends StatelessWidget {
  const AssignmentsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          SizedBox(height: 50),
          Text(
            "Your Assignments",
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20),
          Text(
            "You have 3 upcoming assignments.",
            style: TextStyle(fontSize: 20, color: Colors.grey),
          ),
          SizedBox(height: 40),
          ListTile(
            leading: Icon(Icons.book, color: Colors.cyanAccent),
            title: Text("GET 210 Assignment"),
            subtitle: Text("Due: Tomorrow"),
            trailing: Icon(Icons.warning, color: Colors.redAccent),
          ),
          ListTile(
            leading: Icon(Icons.book, color: Colors.cyanAccent),
            title: Text("GET 206 Assignment"),
            subtitle: Text("Due: Oct 5"),
            trailing: Icon(Icons.more_vert, color: Colors.grey),
          ),
          ListTile(
            leading: Icon(Icons.book, color: Colors.cyanAccent),
            title: Text("GET 204 Assignment"),
            subtitle: Text("Due: Oct 10"),
            trailing: Icon(Icons.more_vert, color: Colors.grey),
          ),
        ],
      ),
    );
  }
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          SizedBox(height: 50),
          CircleAvatar(
            radius: 60,
            backgroundImage: NetworkImage(
              "https://images.unsplash.com/photo-1617531653332-bd46c24f2068?auto=format&fit=crop&q=80&w=1000",
            ),
          ),
          SizedBox(height: 20),
          Text(
            "Abdurrahman Sudais",
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Text(
            "Flutter Developer | Student",
            style: TextStyle(fontSize: 18, color: Colors.grey),
          ),
          SizedBox(height: 30),
          ListTile(
            leading: Icon(Icons.email, color: Colors.cyanAccent),
            title: Text("Email"),
            subtitle: Text("abdurrahmansudais0001@gmail.com"),
          ),
          ListTile(
            leading: Icon(Icons.phone, color: Colors.cyanAccent),
            title: Text("Phone"),
            subtitle: Text("+234 915 565 7641"),
          ),
          ListTile(
            leading: Icon(Icons.school, color: Colors.cyanAccent),
            title: Text("University"),
            subtitle: Text("University of Ilorin"),
          ),
        ],
      ),
    );
  }
}
