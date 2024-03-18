import 'package:flutter/material.dart';
import 'package:pr_4/tasks.dart';

class ColumnDisplay extends StatefulWidget {
  final TaskController controller;

  const ColumnDisplay({super.key, required this.controller});

  @override
  State<ColumnDisplay> createState() => _ColumnDisplayState();
}

class _ColumnDisplayState extends State<ColumnDisplay> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: widget.controller.getTasks().map((task) => TaskRow(
          key: ValueKey(task.id),
          task: task,
          onDelete: (task) => setState(() => widget.controller.removeTask(task.id)),
        )).toList(),
      ),
    );
  }
}
