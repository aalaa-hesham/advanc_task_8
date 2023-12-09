import 'package:advanc_task_8/blocs/todo_bloc.dart';
import 'package:advanc_task_8/pages/todo_list_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(
    BlocProvider<TodoBloc>(
      create: (context) => TodoBloc(),
      child: TodoApp(),
    ),
  );
}

class TodoApp extends StatefulWidget {
  @override
  _TodoAppState createState() => _TodoAppState();
}

class _TodoAppState extends State<TodoApp> {
  final TodoBloc _todoBloc = TodoBloc();

  @override
  void dispose() {
    _todoBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider<TodoBloc>(
        create: (context) => _todoBloc,
        child: TodoListPage(),
      ),
    );
  }
}
