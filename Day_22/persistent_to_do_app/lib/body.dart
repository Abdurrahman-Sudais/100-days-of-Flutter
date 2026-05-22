import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  TextEditingController taskController = TextEditingController();
  List tasks = [];
  @override
  void dispose() {
    taskController.dispose();
    super.dispose();
  }

  void _addTask() {
    if (taskController.text.trim().isEmpty) return;

    setState(() {
      tasks.add([taskController.text, false]);
      taskController.clear();
    });

    saveTasks();
  }

  void _deleteTask(int index) {
    setState(() {
      tasks.removeAt(index);
    });
    saveTasks();
  }

  @override
  void initState() {
    super.initState();
    loadTasks();
  }

  Future<void> saveTasks() async {
    final prefs = await SharedPreferences.getInstance();
    List<String> savedTasks = tasks
        .map((task) => "${task[0]}|${task[1]}")
        .toList();

    await prefs.setStringList("tasks", savedTasks);
  }

  Future<void> loadTasks() async {
    final prefs = await SharedPreferences.getInstance();

    setState(() {
      List<String> savedTasks = prefs.getStringList("tasks") ?? [];

      tasks = savedTasks.map((task) {
        List parts = task.split("|");
        return [parts[0], parts[1] == "true"];
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 5),
        Text(
          "tasks.",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 2),
        Text(
          "May 22, 2026.",
          style: TextStyle(fontSize: 15, color: Colors.white24),
        ),
        SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Row(
            children: [
              Expanded(
                child: Card(
                  child: Column(
                    children: [
                      SizedBox(height: 20),
                      Text(
                        tasks.length.toString(),
                        style: TextStyle(fontSize: 20),
                      ),
                      Text("Total"),
                      SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Card(
                  child: Column(
                    children: [
                      SizedBox(height: 20),
                      Text(
                        tasks.where((t) => t[1] == true).length.toString(),
                        style: TextStyle(fontSize: 20),
                      ),
                      Text("Done"),
                      SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Card(
                  child: Column(
                    children: [
                      SizedBox(height: 20),
                      Text(
                        tasks.where((t) => t[1] == false).length.toString(),
                        style: TextStyle(fontSize: 20),
                      ),
                      Text("remaining"),
                      SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        Divider(),
        SizedBox(height: 5),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  controller: taskController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Add a new task...",
                  ),
                ),
              ),
              SizedBox(width: 20),
              OutlinedButton(
                onPressed: () {
                  _addTask();
                },
                child: Text("Add Task"),
                style: OutlinedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 5),
        Divider(),
        Expanded(
          child: TaskView(
            task: tasks,
            onDelete: _deleteTask,
            onUpdate: () {
              setState(() {});
              saveTasks();
            },
          ),
        ),
      ],
    );
  }
}

class TaskView extends StatefulWidget {
  final List task;
  final Function(int) onDelete;
  final VoidCallback onUpdate;

  const TaskView({
    super.key,
    required this.task,
    required this.onDelete,
    required this.onUpdate,
  });

  @override
  State<TaskView> createState() => _TaskViewState();
}

class _TaskViewState extends State<TaskView> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.task.length,
      itemBuilder: (BuildContext context, int index) {
        return Column(
          children: [
            ListTile(
              title: Text(
                widget.task[index][0],
                style: TextStyle(
                  decoration: widget.task[index][1]
                      ? TextDecoration.lineThrough
                      : TextDecoration.none,
                ),
              ),

              leading: Checkbox(
                value: widget.task[index][1],
                onChanged: (value) {
                  setState(() {
                    widget.task[index][1] = value!;
                  });

                  widget.onUpdate();
                },
              ),

              trailing: OutlinedButton(
                onPressed: () => widget.onDelete(index),
                child: const Icon(Icons.delete),
              ),
            ),

            SizedBox(height: 5),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Divider(),
            ),
          ],
        );
      },
    );
  }
}
