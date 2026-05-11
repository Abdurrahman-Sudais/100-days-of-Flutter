import 'package:flutter/material.dart';

class Chats extends StatefulWidget {
  const Chats({super.key});

  @override
  State<Chats> createState() => _ChatsState();
}

class _ChatsState extends State<Chats> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: ScrollPhysics(),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 8.0,
              horizontal: 10.0,
            ),
            child: TextField(
              decoration: InputDecoration(
                hintText: "Ask Meta AI or Search",
                filled: true,
                fillColor: const Color.fromARGB(255, 63, 63, 63),
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(40),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
          ListTile(
            leading: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(Icons.archive_outlined),
            ),
            title: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 1.0),
              child: Text("Archived"),
            ),
            trailing: Text("1"),
          ),
          ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.teal,
              backgroundImage: NetworkImage(
                "https://files.catbox.moe/ueaiq0.jpg",
              ),
            ),
            title: Text(
              "Abdurrahman Sudais(You)",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text("import 'dart:io'..."),
            trailing: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [Text("3:45 PM"), Icon(Icons.push_pin)],
            ),
          ),
          SizedBox(height: 10),
          ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.teal,
              child: Text("M"),
            ),
            title: Text(
              "My Mummyyy🌹💕🌹",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text("Make sure you drink a lot of water today my baby"),
            trailing: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  "1:28 AM",
                  style: TextStyle(color: Color(0xFF25D366), fontSize: 12),
                ),
                Container(
                  padding: EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    color: Color(0xFF25D366),
                    shape: BoxShape.circle,
                  ),
                  child: Text(
                    "3",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 11,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 10),
          ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.teal,
              child: Text("A"),
            ),
            title: Text(
              "Arya💕🌹",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text("I slept 10 hours yesterday"),
            trailing: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  "6:38 PM",
                  style: TextStyle(color: Color(0xFF25D366), fontSize: 12),
                ),
                Container(
                  padding: EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    color: Color(0xFF25D366),
                    shape: BoxShape.circle,
                  ),
                  child: Text(
                    "2",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 11,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 10),
          ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.teal,
              child: Text("U"),
            ),
            title: Text(
              "Ustadh Nurdeen",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text("Visit intelligeeksafrica.com for more info"),
            trailing: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  "1:30 AM",
                  style: TextStyle(color: Color(0xFF25D366), fontSize: 12),
                ),
                Container(
                  padding: EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    color: Color(0xFF25D366),
                    shape: BoxShape.circle,
                  ),
                  child: Text(
                    "1",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 11,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 10),
          ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.purple,
              backgroundImage: NetworkImage(
                "https://files.catbox.moe/dne937.jpg",
              ),
            ),
            title: Text(
              "Aisha💕💕",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text("You are my master oo sudais"),
            trailing: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  "11:28 AM",
                  style: TextStyle(color: Color(0xFF25D366), fontSize: 12),
                ),
                Container(
                  padding: EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    color: Color(0xFF25D366),
                    shape: BoxShape.circle,
                  ),
                  child: Text(
                    "3",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 11,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 10),
          ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.teal,
              backgroundImage: NetworkImage(
                "https://files.catbox.moe/bx7qsj.png",
              ),
            ),
            title: Text("??", style: TextStyle(fontWeight: FontWeight.bold)),
            subtitle: Text(
              "typing...",
              style: TextStyle(color: Color(0xFF25D366), fontSize: 12),
            ),
            trailing: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  "12:48 PM",
                  style: TextStyle(color: Color(0xFF25D366), fontSize: 12),
                ),
                Container(
                  padding: EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    color: Color(0xFF25D366),
                    shape: BoxShape.circle,
                  ),
                  child: Text(
                    "5",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 11,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 10),
          ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.teal,
              child: Text("A"),
            ),
            title: Text("Awwal", style: TextStyle(fontWeight: FontWeight.bold)),
            subtitle: Text("Wassup bro!"),
            trailing: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [Text("12:58 AM", style: TextStyle(fontSize: 12))],
            ),
          ),
        ],
      ),
    );
    ;
  }
}
