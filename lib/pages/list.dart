import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/models/taskProvider.dart';
import 'package:todo/pages/widgets/taskList.dart';

class ListPage extends StatefulWidget {
  const ListPage({Key? key}) : super(key: key);

  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  String taskTitle = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: Text("Task List"),),
      backgroundColor: Colors.lightBlueAccent,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CircleAvatar(
                    child: Icon(
                      Icons.list,
                      size: 30.0,
                      color: Colors.lightBlueAccent,
                    ),
                    backgroundColor: Colors.white,
                    radius: 30.0,
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  const Text(
                    "Todoey",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 50.0,
                        fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "${Provider.of<TaskProvider>(context).taskCount} Tasks",
                    style: const TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ],
              ),
            ),
            Expanded(
                child: Container(
              padding: EdgeInsets.all(20.0),
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20.0),
                      topRight: Radius.circular(20.0))),
              child: Center(child: TaskList()),
            ))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.lightBlueAccent,
        onPressed: () {
          setState(() {
            taskTitle = "";
          });
          showAddModal(context);
        },
        child: Icon(Icons.add),
      ),
    );
  }

  void showAddModal(BuildContext context) {
    showModalBottomSheet(
        context: context,
        elevation: 0,
        isScrollControlled: true,
        backgroundColor: Color(0xff757575),
        constraints: BoxConstraints(
          maxHeight: MediaQuery.of(context).size.height -
              MediaQuery.of(context).viewPadding.top,
        ),
        builder: (BuildContext context) => AnimatedPadding(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom),
              duration: Duration.zero,
              child: Container(
                padding:
                    EdgeInsets.only(top: 30, left: 30, right: 30, bottom: 10),
                height: 200,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20.0),
                        topRight: Radius.circular(20.0))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Text(
                      "Add Task",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.lightBlueAccent,
                          fontWeight: FontWeight.w700,
                          fontSize: 30),
                    ),
                    TextField(
                      textAlign: TextAlign.center,
                      onChanged: (text) {
                        taskTitle = text;
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        if (taskTitle.trim().isEmpty) return;
                        Provider.of<TaskProvider>(context, listen: false)
                            .add(taskTitle.trim());
                        Navigator.of(context).pop();
                      },
                      child: Text("Add"),
                    ),
                  ],
                ),
              ),
            ));
  }
}
