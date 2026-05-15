import 'package:flutter/material.dart';
import 'package:mini_social_media_app/post.dart';
import 'package:mini_social_media_app/profile_page.dart';

class HomePage1 extends StatefulWidget {
  const HomePage1({super.key});

  @override
  State<HomePage1> createState() => _HomePage1State();
}

class _HomePage1State extends State<HomePage1> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
                    Column(
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.blueGrey.withOpacity(1),
                          radius: 30,
                          child: IconButton(
                            splashColor: null,
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return Post();
                                  },
                                ),
                              );
                            },
                            icon: Icon(Icons.add),
                          ),
                        ),
                        SizedBox(height: 10),
                        Text("Add Status"),
                      ],
                    ),
                    SizedBox(width: 10),
                    VerticalDivider(),
                    SizedBox(width: 10),
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
                    leading: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return ProfilePage();
                            },
                          ),
                        );
                      },
                      child: Hero(
                        tag: "Profile",
                        child: CircleAvatar(
                          backgroundColor: Colors.green.withOpacity(0.6),
                          child: Text("S"),
                        ),
                      ),
                    ),
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
                    leading: CircleAvatar(
                      backgroundColor: Colors.red.withOpacity(0.6),
                      child: Text("Q"),
                    ),
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
    );
  }
}

Widget _avatar(String letter, String name) {
  return Column(
    children: [
      Container(
        padding: const EdgeInsets.all(2), // gap between border and avatar
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: Colors.black, width: 1.5),
        ),
        child: CircleAvatar(
          backgroundColor: Colors.grey.withOpacity(0.6),
          radius: 30,
          child: Text(letter),
        ),
      ),
      SizedBox(height: 10),
      Text(name),
    ],
  );
}
