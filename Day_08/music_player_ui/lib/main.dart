import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
          brightness: Brightness.dark,
        ),
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Music Player"),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 57, 63, 60),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                height: 300.0,
                child: Image.network(
                  "https://images.unsplash.com/photo-1617531653332-bd46c24f2068?auto=format&fit=crop&q=80&w=1000",
                ),
              ),
              const SizedBox(height: 20.0),
              Stack(
                children: [
                  Center(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        color: const Color.fromARGB(255, 60, 211, 13),
                      ),
                      height: 150.0,
                      width: 300.0,
                    ),
                  ),
                  Column(
                    children: [
                      Text(
                        "FRIDAYS",
                        style: TextStyle(
                          fontSize: 40.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            radius: 10,
                            backgroundImage: NetworkImage(
                              "https://images.unsplash.com/photo-1508214751196-bcfd4ca60f91?auto=format&fit=crop&q=80&w=1000",
                            ),
                          ),
                          SizedBox(width: 10),
                          Text("Micah Palace"),
                        ],
                      ),
                      const SizedBox(height: 20.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.skip_previous),
                          ),
                          SizedBox(width: 20),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.play_arrow),
                          ),
                          SizedBox(width: 20),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.skip_next),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),

              SizedBox(height: 20.0),
              Text(
                "PLAYLIST",
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10.0),
              ListTile(
                leading: CircleAvatar(
                  radius: 10,
                  backgroundImage: NetworkImage(
                    "https://images.unsplash.com/photo-1508214751196-bcfd4ca60f91?auto=format&fit=crop&q=80&w=1000",
                  ),
                ),
                title: Text("SPRINTER"),
                subtitle: Text("Dave"),
                tileColor: Color(Colors.grey[800]!.value),
                trailing: Icon(Icons.play_arrow),
              ),
              Divider(color: Colors.grey[800]),
              ListTile(
                leading: CircleAvatar(
                  radius: 10,
                  backgroundImage: NetworkImage(
                    "https://images.unsplash.com/photo-1508214751196-bcfd4ca60f91?auto=format&fit=crop&q=80&w=1000",
                  ),
                ),
                title: Text("Alone"),
                subtitle: Text("Alan Walker"),
                tileColor: Color(Colors.grey[800]!.value),
                trailing: Icon(Icons.play_arrow),
              ),
              Divider(color: Colors.grey[800]),
              ListTile(
                leading: CircleAvatar(
                  radius: 10,
                  backgroundImage: NetworkImage(
                    "https://images.unsplash.com/photo-1508214751196-bcfd4ca60f91?auto=format&fit=crop&q=80&w=1000",
                  ),
                ),
                title: Text("BAND4BAND"),
                subtitle: Text("Central Cee"),
                tileColor: Color(Colors.grey[800]!.value),
                trailing: Icon(Icons.play_arrow),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
