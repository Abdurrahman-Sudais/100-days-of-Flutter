import 'package:flutter/material.dart';

class Detail extends StatefulWidget {
  const Detail({super.key});

  @override
  State<Detail> createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Burger")),
      body: Column(
        children: [
          Hero(
            tag: "burger",
            child: Container(
              height: 300,
              width: double.infinity,
              decoration: BoxDecoration(color: Color(0xFFFFF3E8)),
              child: Center(child: Text("🍔", style: TextStyle(fontSize: 200))),
            ),
          ),
          Padding(
            padding: EdgeInsetsGeometry.only(left: 20, right: 20, top: 10),
            child: Column(
              children: [
                ListTile(
                  title: Text(
                    "Classic Burger",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                  ),
                  subtitle: Row(
                    children: [
                      Icon(Icons.star, color: Color(0xFFFF5722)),
                      Icon(Icons.star, color: Color(0xFFFF5722)),
                      Icon(Icons.star, color: Color(0xFFFF5722)),
                      Icon(Icons.star, color: Color(0xFFFF5722)),
                      Icon(Icons.star_border, color: Color(0xFFFF5722)),
                    ],
                  ),
                  trailing: Text(
                    "₦1,500",
                    style: TextStyle(fontSize: 20, color: Color(0xFFFF5722)),
                  ),
                ),
                Divider(),
                SizedBox(height: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Description",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 8.0),
                    Text(
                      "Juicy beef patty with melted cheddar, fresh lettuce, tomato, and our signature house sauce in a toasted brioche bun.",
                      style: TextStyle(color: Colors.white38),
                    ),
                    SizedBox(height: 80),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        OutlinedButton(
                          onPressed: () {},
                          style: OutlinedButton.styleFrom(
                            shape: StadiumBorder(),
                          ),
                          child: Text("Save"),
                        ),
                        FilledButton(
                          style: FilledButton.styleFrom(
                            backgroundColor: Color(0xFFFF5722),
                          ),
                          onPressed: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text("Added to cart!"),
                                behavior: SnackBarBehavior.floating,
                                duration: Duration(
                                  seconds: 1,
                                  milliseconds: 500,
                                ),
                              ),
                            );
                          },
                          child: Row(
                            children: [
                              Icon(Icons.stroller),
                              Text("Add to cart"),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
