import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() => runApp(
  DevicePreview(enabled: !kReleaseMode, builder: (context) => const MyApp()),
);

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      useInheritedMediaQuery: true,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurpleAccent,
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
  Widget profileCard() {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final isWide = constraints.maxWidth > 600;
        return ConstrainedBox(
          constraints: BoxConstraints(maxWidth: isWide ? 900 : 500),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
                side: BorderSide(color: Colors.white24),
              ),
              child: isWide ? largeScreen() : smallScreen(),
            ),
          ),
        );
      },
    );
  }

  Widget largeScreen() {
    return IntrinsicHeight(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CircleAvatar(radius: 70),
                SizedBox(height: 16),
                Text(
                  "Abdurrahman Sudais",
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
                ),
                SizedBox(height: 4),
                Text(
                  "Computer Engineering",
                  style: TextStyle(color: Colors.grey, fontSize: 12),
                ),
                SizedBox(height: 4),
                Text(
                  "24/30GR090",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 11,
                    fontFamily: 'monospace',
                  ),
                ),
                SizedBox(height: 24),
                Card(
                  shape: RoundedRectangleBorder(
                    side: BorderSide(color: Colors.white30),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12.0,
                      vertical: 6.0,
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          height: 7.0,
                          width: 7.0,
                          decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(7),
                          ),
                        ),
                        SizedBox(width: 6),
                        Text("Active", style: TextStyle(fontSize: 12)),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(width: 20),
            VerticalDivider(color: Colors.white24, thickness: 0.5),
            SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "About",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 13,
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "Flutter dev in training. Day 25 of 100. Building in public and learning every day.",
                    style: TextStyle(fontSize: 13, height: 1.6),
                  ),
                  SizedBox(height: 16),
                  Divider(color: Colors.white24, thickness: 0.5),
                  _infoRow("Level", "200L"),
                  _infoRow("Faculty", "Engineering"),
                  _infoRow("Session", "2024 / 2025"),
                  _infoRow("CGPA", "4.20"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget smallScreen() {
    return Column(
      children: [
        SizedBox(height: 40),
        CircleAvatar(radius: 50),
        SizedBox(height: 16),
        Text(
          "Abdurrahman Sudais",
          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
        ),
        SizedBox(height: 4),
        Text(
          "Computer Engineering",
          style: TextStyle(color: Colors.grey, fontSize: 12),
        ),
        SizedBox(height: 4),
        Text("24/30GR090", style: TextStyle(color: Colors.grey, fontSize: 11)),
        SizedBox(height: 30),
        Divider(color: Colors.white24, thickness: 0.5),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              _infoRow("Level", "200L"),
              _infoRow("Faculty", "Engineering"),
              _infoRow("Session", "2024 / 2025"),
              _infoRow("CGPA", "4.20"),
            ],
          ),
        ),
        Divider(color: Colors.white24, thickness: 0.5),
        SizedBox(height: 16),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "About",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 13,
                  color: Colors.grey,
                ),
              ),
              SizedBox(height: 8),
              Text(
                "Flutter dev in training. Day 25 of 100. Building in public and learning every day.",
                style: TextStyle(fontSize: 13, height: 1.6),
              ),
            ],
          ),
        ),
        SizedBox(height: 20),
        Divider(color: Colors.white24, thickness: 0.5),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 14.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Card(
                shape: RoundedRectangleBorder(
                  side: BorderSide(color: Colors.white30),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12.0,
                    vertical: 6.0,
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        height: 7.0,
                        width: 7.0,
                        decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(7),
                        ),
                      ),
                      SizedBox(width: 6),
                      Text("Active", style: TextStyle(fontSize: 12)),
                    ],
                  ),
                ),
              ),
              Text(
                "2024 / 2025",
                style: TextStyle(color: Colors.grey, fontSize: 12),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _infoRow(String label, String value) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(label, style: TextStyle(color: Colors.grey, fontSize: 13)),
              Text(
                value,
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 13),
              ),
            ],
          ),
        ),
        Divider(height: 0.5, thickness: 0.5, color: Colors.white12),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Student ID"),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12.0),
            child: Icon(Icons.share),
          ),
        ],
      ),
      body: Center(child: SingleChildScrollView(child: profileCard())),
    );
  }
}
