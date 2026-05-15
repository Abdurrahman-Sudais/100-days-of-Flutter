import 'package:flutter/material.dart';

class Notifications extends StatefulWidget {
  const Notifications({super.key});

  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppBar(title: Text("Notifications")),
        Divider(),
        SingleChildScrollView(
          child: Column(
            children: [
              ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.blueAccent,
                  child: Text("S"),
                ),

                title: Row(
                  children: [
                    Text(
                      "Sudais",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(" liked your post"),
                  ],
                ),
                trailing: Text("2m"),
              ),
              Divider(),
              ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.orangeAccent,
                  child: Text("A"),
                ),

                title: Row(
                  children: [
                    Text(
                      "Awwal",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(" started following you"),
                  ],
                ),
                trailing: Text("2h"),
              ),
              Divider(),
              ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.pink,
                  child: Text("Z"),
                ),

                title: Row(
                  children: [
                    Text("Zara", style: TextStyle(fontWeight: FontWeight.bold)),
                    FittedBox(
                      child: Text(' commented on your post "day 17 of..."'),
                    ),
                  ],
                ),
                trailing: Text("4h"),
              ),
              Divider(),
              ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.yellowAccent,
                  child: Text("Q"),
                ),

                title: Row(
                  children: [
                    Text(
                      "Quadratic",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(" mentioned you in a post"),
                  ],
                ),
                trailing: Text("6h"),
              ),
              Divider(),
              ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.redAccent,
                  child: Text("M"),
                ),

                title: Row(
                  children: [
                    Text("MJ", style: TextStyle(fontWeight: FontWeight.bold)),
                    Text(" viewed your profile"),
                  ],
                ),
                trailing: Text("11h"),
              ),
              Divider(),
            ],
          ),
        ),
      ],
    );
  }
}
