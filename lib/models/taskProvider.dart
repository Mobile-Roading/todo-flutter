import 'package:flutter/material.dart';
import 'dart:collection';
import 'package:todo/models/taskModel.dart';

class TaskProvider extends ChangeNotifier {
  final List<TaskModel> _tasks = [];

  int get taskCount {
    return _tasks.length;
  }

  UnmodifiableListView<TaskModel> get tasks {
    return UnmodifiableListView(_tasks);
  }

  TaskModel add(String title) {
    final task = TaskModel(title: title);
    _tasks.add(task);

    notifyListeners();
    return task;
  }

  bool updateStatus(TaskModel task) {
    final res = task.toggleStatus();
    notifyListeners();

    return res;
  }

  void remove(TaskModel task) {
    _tasks.remove(task);
    notifyListeners();
  }
}