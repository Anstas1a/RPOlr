import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:helloworld/models/task_model.dart';
import 'package:helloworld/widgets/task_tile.dart';

class TodoListScreen extends StatefulWidget {
  @override
  _TodoListScreenState createState() => _TodoListScreenState();
}

class _TodoListScreenState extends State<TodoListScreen> {
  List<Task> tasks = [];

  void _deleteTask(Task task) {
    setState(() {
      tasks.remove(task);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todo List'),
      ),
      body: tasks.length > 0
          ? ListView.builder(
              itemCount: tasks.length,
              itemBuilder: (context, index) {
                return TaskTile(
                    task: tasks[index],
                    onTaskDelete: () => _deleteTask(tasks[index]));
              })
          : Text('List is empty'),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                String newTaskTitle = "";

                return AlertDialog(
                  title: Text('Add Task'),
                  content: TextField(
                    onChanged: (value) {
                      newTaskTitle = value;
                    },
                  ),
                  actions: [
                    ElevatedButton(
                        onPressed: () {
                          setState(() {
                            tasks.add(Task(title: newTaskTitle));
                          });
                          Navigator.pop(context);
                        },
                        child: Text('Add'))
                  ],
                );
              });
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
