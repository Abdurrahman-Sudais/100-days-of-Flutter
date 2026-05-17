import 'package:flutter/material.dart';
import 'dart:math';

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
      title: "Quote Generator",
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.black,
          brightness: Brightness.dark,
        ),
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<String> quotes = [
    "Consistency beats motivation every single time.",
    "The secret of getting ahead is getting started.",
    "Do something today that your future self will thank you for.",
    "Hard work beats talent when talent doesn't work hard.",
    "You don't have to be great to start, but you have to start to be great.",
  ];

  int currentIndex = 0;

  void newQuote() {
    setState(() {
      currentIndex = Random().nextInt(quotes.length);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Quotify."),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: Container(
              height: 36,
              width: 46,
              decoration: BoxDecoration(
                border: BoxBorder.all(color: Colors.white),
                borderRadius: BorderRadius.circular(15),
                //shape: BoxShape.circle,
                color: Colors.black12,
              ),
              child: Icon(Icons.light_mode),
            ),
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(
            children: [
              Container(
                height: 300,
                width: 300,
                child: Card(
                  color: Colors.grey.withOpacity(0.1),
                  child: Column(
                    children: [
                      SizedBox(height: 30),
                      Text(
                        '"',
                        style: TextStyle(fontFamily: 'Georgia', fontSize: 48),
                      ),
                      SizedBox(height: 30),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          quotes[currentIndex],
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 20,
                            height: 1.7,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: 20,
                right: 30,
                child: Container(
                  height: 50,
                  width: 70,
                  child: Card(
                    color: Colors.grey.withOpacity(0.1),
                    child: Icon(Icons.copy, size: 20),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 7,
                width: 7,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white12,
                ),
              ),
              SizedBox(width: 7),
              Container(
                height: 9,
                width: 9,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
              ),
              SizedBox(width: 7),
              Container(
                height: 7,
                width: 7,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white12,
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(SnackBar(content: Text("Saved!")));
                },
                child: Container(
                  height: 50,
                  width: 80,
                  decoration: BoxDecoration(
                    border: BoxBorder.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(15),
                    //shape: BoxShape.circle,
                    color: Colors.black12,
                  ),
                  child: Center(child: Text("Save")),
                ),
              ),
              SizedBox(width: 30),
              GestureDetector(
                onTap: () {
                  newQuote();
                },
                child: Container(
                  height: 50,
                  width: 150,
                  decoration: BoxDecoration(
                    border: BoxBorder.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(15),
                    //shape: BoxShape.circle,
                    color: Colors.black12,
                  ),
                  child: Center(child: Text("New Quote")),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
