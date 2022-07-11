import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/models/taskProvider.dart';

class TaskList extends StatelessWidget {
  const TaskList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: Provider.of<TaskProvider>(context).taskCount,
        itemBuilder: (context, index) {
          final taskProvider = Provider.of<TaskProvider>(context);
          final task = taskProvider.tasks[index];

          return ListTile(
            onLongPress: () {
              taskProvider.remove(task);
            },
            title: Text(task.title, style: TextStyle(decoration: task.isCompleted ? TextDecoration.lineThrough : null),),
            trailing: Checkbox(
                value: task.isCompleted,
                onChanged: (status) {
                  taskProvider.updateStatus(task);
                }),
          );
        });
  }
}
