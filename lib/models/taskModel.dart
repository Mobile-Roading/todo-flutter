class TaskModel {
  String title;
  bool isCompleted;

  TaskModel({required this.title, this.isCompleted = false});

  bool toggleStatus([bool? status]) {
    if (status != null) {
      isCompleted = status;
      return status;
    }

    isCompleted = !isCompleted;
    return isCompleted;
  }
}

