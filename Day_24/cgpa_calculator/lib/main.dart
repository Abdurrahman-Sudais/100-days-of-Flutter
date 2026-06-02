import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
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
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.indigo,
          brightness: Brightness.dark,
        ),
      ),
      home: homePage(),
    );
  }
}

class homePage extends StatefulWidget {
  const homePage({super.key});

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  Widget gradeSelector() {
    String? selectedGrade;
    return Row(
      children: [
        DropdownButton(
          value: selectedGrade,
          hint: Text("Grade"),
          items: ["A", "B", "C", "D", "E", "F"].map((grade) {
            return DropdownMenuItem<String>(value: grade, child: Text(grade));
          }).toList(),
          onChanged: (value) {
            setState(() {
              value = selectedGrade;
            });
          },
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("CGPA Calculator")),
      body: Column(
        children: [
          Text("Computer Enginnering • 200lvl"),
          Divider(),
          cgpaCard(),
          rowCard(),
          SizedBox(height: 10),
          textField(),
          gradeSelector(),
        ],
      ),
    );
  }
}

Widget cgpaCard() {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 8.0),
    child: Expanded(
      child: Card(
        margin: EdgeInsets.all(10),
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Text("Current cgpa", style: TextStyle(color: Colors.white24)),
                  Text(
                    "4.36",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Card(
                color: Colors.white30,
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Text("Second class upper"),
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}

Widget rowCard() {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 18.0),
    child: Row(
      children: [
        Expanded(
          child: Card(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 12.0,
                vertical: 12.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [Text("13"), Text("total units")],
              ),
            ),
          ),
        ),
        Expanded(
          child: Card(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 12.0,
                vertical: 12.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [Text("13"), Text("total units")],
              ),
            ),
          ),
        ),
        Expanded(
          child: Card(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 12.0,
                vertical: 12.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [Text("13"), Text("total units")],
              ),
            ),
          ),
        ),
      ],
    ),
  );
}

Widget textField() {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 18.0),
    child: Row(
      children: [
        Expanded(
          flex: 3,
          child: TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: "Course code e.g MTH 101",
            ),
          ),
        ),
        SizedBox(width: 5),
        Expanded(
          child: TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: "Units",
            ),
            keyboardType: TextInputType.number,
          ),
        ),
      ],
    ),
  );
}
