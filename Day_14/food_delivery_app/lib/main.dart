import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:food_delivery_app/pages/popular_foods.dart';

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
      title: "Food Delivery Application",
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Good Morning!"),
        backgroundColor: Color(0xFFFF5722),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 125,
              color: Color(0xFFFF5722),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("What would you like to eat today?"),
                    SizedBox(height: 20),
                    SearchBar(
                      hintText: "Search food, restaurant...",
                      leading: Icon(Icons.search),
                      backgroundColor: WidgetStatePropertyAll(Colors.black38),
                      shape: WidgetStatePropertyAll<OutlinedBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(left: 15.0, right: 15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("CATEGORIES"),
                  SizedBox(height: 10),
                  SingleChildScrollView(
                    physics: ScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        FilledButton(
                          onPressed: () {},
                          style: FilledButton.styleFrom(
                            backgroundColor: Color(0xFFFF5722),
                          ),
                          child: Text("All"),
                        ),
                        SizedBox(width: 50),
                        FilledButton(
                          onPressed: () {},
                          style: FilledButton.styleFrom(
                            backgroundColor: Color.fromARGB(255, 212, 209, 208),
                          ),
                          child: Text("🍔 Burgers"),
                        ),
                        SizedBox(width: 50),
                        FilledButton(
                          onPressed: () {},
                          style: FilledButton.styleFrom(
                            backgroundColor: Color.fromARGB(255, 212, 209, 208),
                          ),
                          child: Text("🍕 Pizza"),
                        ),
                        SizedBox(width: 50),
                        FilledButton(
                          onPressed: () {},
                          style: FilledButton.styleFrom(
                            backgroundColor: Color.fromARGB(255, 212, 209, 208),
                          ),
                          child: Text("🍟 Fries"),
                        ),
                        SizedBox(width: 50),
                        FilledButton(
                          onPressed: () {},
                          style: FilledButton.styleFrom(
                            backgroundColor: Color.fromARGB(255, 212, 209, 208),
                          ),
                          child: Text("🍸 Drinks"),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  PopularFoods(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
