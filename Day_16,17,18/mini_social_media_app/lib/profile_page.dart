import 'package:flutter/material.dart';
import 'package:mini_social_media_app/notifiers.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            
          },
          icon: Icon(Icons.arrow_back),
        ),
        actions: [
          ValueListenableBuilder<bool>(
            valueListenable: isDarkMode,
            builder: (context, isDark, child) {
              return Padding(
                padding: const EdgeInsets.only(right: 17.0),
                child: IconButton(
                  onPressed: () {
                    isDarkMode.value = !isDarkMode.value;
                  },
                  icon: Icon(isDark ? Icons.light_mode : Icons.dark_mode),
                ),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20.0, left: 20.0),
                  child: Hero(
                    tag: "Profile",
                    child: CircleAvatar(
                      backgroundColor: Colors.greenAccent.withOpacity(0.6),
                      radius: 60,
                      child: Text(
                        "S",
                        style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 30),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Sudais",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 15),
                    Text("Flutter dev in training."),
                    SizedBox(height: 15),
                    OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        minimumSize: Size(50, 50),
                      ),
                      onPressed: () {},
                      child: Text("Edit profile"),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 20),
            Divider(),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: ValueListenableBuilder(
                valueListenable: isDarkMode,
                builder: (context, isDark, child) {
                  return Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 70,
                          // color: Colors.black,
                          child: Card(
                            color: isDark
                                ? Colors.black.withOpacity(0.2)
                                : Colors.white.withOpacity(0.8),
                            child: Center(
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    "4",
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text("Photos"),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          height: 70,
                          // color: Colors.blueAccent,
                          child: Card(
                            color: isDark
                                ? Colors.black.withOpacity(0.2)
                                : Colors.white.withOpacity(0.8),
                            child: Center(
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    "1.2K",
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text("Followers"),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          height: 70,

                          // color: Colors.red,
                          child: Card(
                            color: isDark
                                ? Colors.black.withOpacity(0.2)
                                : Colors.white.withOpacity(0.8),
                            child: Center(
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    "20",
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text("Following"),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
            SizedBox(height: 10),
            GridView.count(
              crossAxisCount: 3,
              crossAxisSpacing: 2,
              mainAxisSpacing: 2,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              children: [
                _gridPhoto("https://files.catbox.moe/bx7qsj.png"),
                _gridPhoto("https://files.catbox.moe/dne937.jpg"),
                _gridPhoto("https://files.catbox.moe/ueaiq0.jpg"),
                _gridPhoto("https://files.catbox.moe/bx7qsj.png"),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

Widget _gridPhoto(String url) {
  return ClipRRect(
    borderRadius: BorderRadiusGeometry.circular(12),
    child: Image.network(url, fit: BoxFit.cover),
  );
}
