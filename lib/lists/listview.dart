import 'package:flutter/material.dart';
import 'package:pr_4/tasks.dart';

class ListViewDisplay extends StatefulWidget {
  final TaskController controller;

  const ListViewDisplay({super.key, required this.controller});

  @override
  State<ListViewDisplay> createState() => _ListViewDisplayState();
}

class _ListViewDisplayState extends State<ListViewDisplay> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: widget.controller.getTasks().map((task) => TaskRow(
        key: ValueKey(task.id),
        task: task,
        onDelete: (task) => setState(() => widget.controller.removeTask(task.id)),
      )).toList(),
    );
  }
}
