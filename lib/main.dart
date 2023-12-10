import 'package:advanc_task_8/blocs/todo_bloc.dart';
import 'package:advanc_task_8/pages/todo_list_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(TodoApp());
}

class TodoApp extends StatelessWidget {
  final TodoBloc _todoBloc = TodoBloc();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [BlocProvider(create:  (context) => _todoBloc)],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: TodoListPage(),
      ),
    );
  }
}
