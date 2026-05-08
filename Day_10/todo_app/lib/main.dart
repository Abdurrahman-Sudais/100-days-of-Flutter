import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "My Todo App",
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.transparent,
          brightness: Brightness.dark,
        ),
      ),
      home: MyTodoApp(),
    );
  }
}

class MyTodoApp extends StatefulWidget {
  const MyTodoApp({super.key});

  @override
  State<MyTodoApp> createState() => _MyTodoAppState();
}

class _MyTodoAppState extends State<MyTodoApp> {
  List<String> todoList = [];
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: Text('TO-DO APP', style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              String newTodo = '';
              return AlertDialog(
                title: Text('Add New To-Do'),
                content: TextField(
                  onChanged: (value) {
                    newTodo = value;
                  },
                  decoration: InputDecoration(hintText: 'Enter to-do item'),
                ),
                actions: [
                  TextButton(
                    onPressed: () {
                      setState(() {
                        if (newTodo.isNotEmpty) {
                          todoList.add(newTodo);
                        }
                      });
                      Navigator.of(context).pop();
                    },
                    child: Text('Add'),
                  ),
                ],
              );
            },
          );
        },
      ),
      body: ListView.builder(
        itemCount: todoList.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(todoList[index]),
            leading: IconButton(
              onPressed: () {
                // Handle leading icon press
                setState(() {
                  isChecked = !isChecked;
                });
              },
              icon: isChecked
                  ? Icon(Icons.check)
                  : Icon(Icons.check_box_outline_blank),
            ),
            trailing: IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                setState(() {
                  todoList.removeAt(index);
                });
              },
            ),
          );
        },
      ),
    );
  }
}
