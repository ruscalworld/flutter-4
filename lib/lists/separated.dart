import 'package:flutter/material.dart';
import 'package:pr_4/tasks.dart';

class SeparatedListViewDisplay extends StatefulWidget {
  final TaskController controller;

  const SeparatedListViewDisplay({super.key, required this.controller});

  @override
  State<SeparatedListViewDisplay> createState() => _SeparatedListViewDisplayState();
}

class _SeparatedListViewDisplayState extends State<SeparatedListViewDisplay> {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (_, position) => TaskRow(
        key: ValueKey(widget.controller.getTasks()[position].id),
        task: widget.controller.getTasks()[position],
        onDelete: (task) => setState(() => widget.controller.removeTask(task.id)),
      ),
      separatorBuilder: (_, __) => const Divider(),
      itemCount: widget.controller.getTasks().length,
    );
  }
}
