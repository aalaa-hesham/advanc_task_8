import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:advanc_task_8/blocs/cubit.dart';
import 'package:advanc_task_8/models/todo.dart';
import 'package:advanc_task_8/pages/add_todo_page.dart';

class TodoList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 26, 12, 105),
        title: Center(child: Text('Todo List')),
      ),
      body: BlocBuilder<TodoCubit, List<Todo>>(
        builder: (context, state) {
          return ListView.builder(
            itemCount: state.length,
            itemBuilder: (context, index) {
              final todo = state[index];
              return Padding(
                padding: const EdgeInsets.only(top: 5.0),
                child: Container(
                  color: Colors.amber,
                  child: ListTile(
                    title: Text(todo.name),
                    subtitle: Text(todo.description),
                    onTap: () =>
                        context.read<TodoCubit>().removeTodoItem(index),
                  ),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final todo = await Navigator.of(context).push<Todo>(
            MaterialPageRoute(
              builder: (BuildContext context) {
                return AddTodoScreen();
              },
            ),
          );
          if (todo != null) {
            context.read<TodoCubit>().addTodoItem(todo);
          }
        },
        tooltip: 'Add information',
        child: Icon(Icons.add),
      ),
    );
  }
}
