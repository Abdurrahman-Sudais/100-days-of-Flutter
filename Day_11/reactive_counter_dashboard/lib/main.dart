import 'package:flutter/material.dart';
import 'package:reactive_counter_dashboard/data/notifiers.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'X clone',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.white10,
          brightness: Brightness.dark,
        ),
      ),
      home: const MyApp(),
    );
  }
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: const Text(
            "X",
            style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
          ),
        ),
        centerTitle: true,
        leading: Padding(
          padding: const EdgeInsets.only(left: 12.0, top: 8.0),
          child: CircleAvatar(
            radius: 4,
            backgroundImage: NetworkImage(
              'https://images.unsplash.com/photo-1617531653332-bd46c24f2068?auto=format&fit=crop&q=80&w=1000',
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                const Text("Upgrade"),
                SizedBox(width: 10),
                Icon(Icons.more_vert),
              ],
            ),
          ),
        ],
      ),
      body: ListView(
        children: [
          Column(
            children: [
              ListTile(
                isThreeLine: true,
                leading: CircleAvatar(
                  radius: 13,
                  backgroundImage: NetworkImage(
                    'https://images.unsplash.com/photo-1617531653332-bd46c24f2068?auto=format&fit=crop&q=80&w=1000',
                  ),
                ),
                title: Row(
                  children: [
                    Text(
                      "Abdurrahman Sudais",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 10,
                      ),
                    ),
                    SizedBox(width: 4),
                    Icon(Icons.verified, size: 10, color: Colors.blue),
                    SizedBox(width: 4),
                    Text(
                      "@sudais_code · 2h",
                      style: TextStyle(color: Colors.grey, fontSize: 10),
                    ),
                  ],
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Working on a new Flutter project today! 🚀 #Dart #Coding",
                      style: TextStyle(fontSize: 10),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Image.network(
                          'https://images.unsplash.com/photo-1617531653332-bd46c24f2068?auto=format&fit=crop&q=80&w=1000',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.chat_bubble_outline, size: 16),
                            SizedBox(width: 4),
                            Text("10", style: TextStyle(fontSize: 10)),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(Icons.repeat, size: 16),
                            SizedBox(width: 4),
                            Text("10", style: TextStyle(fontSize: 10)),
                          ],
                        ),
                        ValueListenableBuilder(
                          valueListenable: likesNotifier,
                          builder:
                              (
                                BuildContext context,
                                dynamic likes,
                                Widget? child,
                              ) {
                                return Row(
                                  children: [
                                    Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        IconButton(
                                          iconSize: 16,
                                          onPressed: () {
                                            likesNotifier.value > 0
                                                ? likesNotifier.value--
                                                : null;
                                          },
                                          icon: Icon(
                                            Icons.favorite_border_outlined,
                                          ),
                                        ),
                                        IconButton(
                                          iconSize: 16,
                                          onPressed: () {
                                            likesNotifier.value++;
                                          },
                                          icon: Icon(
                                            Icons.favorite,
                                            color: Colors.red,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(width: 4),
                                    Text(
                                      likes.toString(),
                                      style: TextStyle(fontSize: 10),
                                    ),
                                  ],
                                );
                              },
                        ),
                        Row(
                          children: [
                            Icon(Icons.bar_chart_outlined, size: 16),
                            SizedBox(width: 4),
                            Text("10", style: TextStyle(fontSize: 10)),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Icon(Icons.bookmark_border_outlined, size: 16),
                            SizedBox(width: 4),
                            Icon(Icons.share_outlined, size: 16),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Divider(thickness: 1),

              ListTile(
                isThreeLine: true,
                leading: CircleAvatar(
                  radius: 13,
                  backgroundImage: NetworkImage(
                    'https://images.unsplash.com/photo-1604948501466-4e9c339b9c24?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8Y2hlc3MlMjBib2FyZHxlbnwwfHwwfHx8MA%3D%3D',
                  ),
                ),
                title: Row(
                  children: [
                    Text(
                      "Chess.com",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 10,
                      ),
                    ),
                    SizedBox(width: 4),
                    Icon(Icons.verified, size: 10, color: Colors.blue),
                    SizedBox(width: 4),
                    Text(
                      "@chesscom · 3h",
                      style: TextStyle(color: Colors.grey, fontSize: 10),
                    ),
                  ],
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "And he sacrificed, the roooooooooook #Chess #EpicMoves",
                      style: TextStyle(fontSize: 10),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Image.network(
                          'https://images.unsplash.com/photo-1604948501466-4e9c339b9c24?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8Y2hlc3MlMjBib2FyZHxlbnwwfHwwfHx8MA%3D%3D',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.chat_bubble_outline, size: 16),
                            SizedBox(width: 4),
                            Text("10", style: TextStyle(fontSize: 10)),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(Icons.repeat, size: 16),
                            SizedBox(width: 4),
                            Text("10", style: TextStyle(fontSize: 10)),
                          ],
                        ),
                        ValueListenableBuilder(
                          valueListenable: likesNotifier,
                          builder:
                              (
                                BuildContext context,
                                dynamic likes,
                                Widget? child,
                              ) {
                                return Row(
                                  children: [
                                    Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        IconButton(
                                          iconSize: 16,
                                          onPressed: () {
                                            likesNotifier.value > 0
                                                ? likesNotifier.value--
                                                : null;
                                          },
                                          icon: Icon(
                                            Icons.favorite_border_outlined,
                                          ),
                                        ),
                                        IconButton(
                                          iconSize: 16,
                                          onPressed: () {
                                            likesNotifier.value++;
                                          },
                                          icon: Icon(
                                            Icons.favorite,
                                            color: Colors.red,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(width: 4),
                                    Text(
                                      likes.toString(),
                                      style: TextStyle(fontSize: 10),
                                    ),
                                  ],
                                );
                              },
                        ),
                        Row(
                          children: [
                            Icon(Icons.bar_chart_outlined, size: 16),
                            SizedBox(width: 4),
                            Text("10", style: TextStyle(fontSize: 10)),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Icon(Icons.bookmark_border_outlined, size: 16),
                            SizedBox(width: 4),
                            Icon(Icons.share_outlined, size: 16),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Divider(thickness: 1),

              ListTile(
                isThreeLine: true,
                leading: CircleAvatar(
                  radius: 13,
                  backgroundImage: NetworkImage(
                    'https://images.unsplash.com/photo-1617531653332-bd46c24f2068?auto=format&fit=crop&q=80&w=1000',
                  ),
                ),
                title: Row(
                  children: [
                    Text(
                      "Abdurrahman Sudais",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 10,
                      ),
                    ),
                    SizedBox(width: 4),
                    Icon(Icons.verified, size: 10, color: Colors.blue),
                    SizedBox(width: 4),
                    Text(
                      "@chesscom · 7h",
                      style: TextStyle(color: Colors.grey, fontSize: 10),
                    ),
                  ],
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Working on a new Flutter clone today! 🚀 #Dart #Coding",
                      style: TextStyle(fontSize: 10),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Image.network(
                          'https://images.unsplash.com/photo-1617531653332-bd46c24f2068?auto=format&fit=crop&q=80&w=1000',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.chat_bubble_outline, size: 16),
                            SizedBox(width: 4),
                            Text("10", style: TextStyle(fontSize: 10)),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(Icons.repeat, size: 16),
                            SizedBox(width: 4),
                            Text("10", style: TextStyle(fontSize: 10)),
                          ],
                        ),
                        ValueListenableBuilder(
                          valueListenable: likesNotifier,
                          builder:
                              (
                                BuildContext context,
                                dynamic likes,
                                Widget? child,
                              ) {
                                return Row(
                                  children: [
                                    Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        IconButton(
                                          iconSize: 16,
                                          onPressed: () {
                                            likesNotifier.value > 0
                                                ? likesNotifier.value--
                                                : null;
                                          },
                                          icon: Icon(
                                            Icons.favorite_border_outlined,
                                          ),
                                        ),
                                        IconButton(
                                          iconSize: 16,
                                          onPressed: () {
                                            likesNotifier.value++;
                                          },
                                          icon: Icon(
                                            Icons.favorite,
                                            color: Colors.red,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(width: 4),
                                    Text(
                                      likes.toString(),
                                      style: TextStyle(fontSize: 10),
                                    ),
                                  ],
                                );
                              },
                        ),
                        Row(
                          children: [
                            Icon(Icons.bar_chart_outlined, size: 16),
                            SizedBox(width: 4),
                            Text("10", style: TextStyle(fontSize: 10)),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Icon(Icons.bookmark_border_outlined, size: 16),
                            SizedBox(width: 4),
                            Icon(Icons.share_outlined, size: 16),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Divider(thickness: 1),
            ],
          ),
        ],
      ),
    );
  }
}
