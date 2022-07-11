import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/models/taskProvider.dart';
import 'package:todo/pages/list.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TaskProvider(),
      child: MaterialApp(
        home: ListPage(),
      ));
  }
}
