import 'package:flutter/material.dart';
import 'package:helloworld/models/task_model.dart';

class TaskTile extends StatefulWidget {
  final Task task;
  final VoidCallback onTaskDelete;

  TaskTile({
    required this.task,
    required this.onTaskDelete,
    super.key,
  });

  @override
  _TaskTileState createState() => _TaskTileState();
}

class _TaskTileState extends State<TaskTile> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
        title: Text(widget.task.title),
        leading: Icon(Icons.delete),
        trailing: Checkbox(
          value: widget.task.isCompleted,
          onChanged: (value) {
            setState(() {
              widget.task.isCompleted = value!;
            });
          },
        ),
        onTap: () {
          widget.onTaskDelete();
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('${widget.task.title} deleted'),
            ),
          );
        });
  }
}
