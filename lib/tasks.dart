import 'package:flutter/material.dart';

class Task {
  final int id;
  final String title;
  final String text;

  Task({required this.id, required this.title, required this.text});
}

class TaskController {
  int _lastId = 0;
  final List<Task> _tasks = [];

  void addTask(String title, String text) {
    _lastId++;
    _tasks.add(Task(id: _lastId, title: title, text: text));
  }

  void removeTask(int id) {
    _tasks.removeWhere((element) => element.id == id);
  }

  List<Task> getTasks() {
    return _tasks;
  }
}

class TaskRow extends StatelessWidget {
  final Task task;
  final Function(Task task) onDelete;

  const TaskRow({super.key, required this.task, required this.onDelete});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: () => onDelete(task),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(task.title, style: const TextStyle(fontWeight: FontWeight.bold)),
            Text(task.text),
          ],
        ),
      ),
    );
  }
}
