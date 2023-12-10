import 'package:advanc_task_8/blocs/cubit.dart';
import 'package:advanc_task_8/blocs/todo_bloc.dart';
import 'package:advanc_task_8/models/todo.dart';
import 'package:advanc_task_8/pages/add_todo_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TodoList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 26, 12, 105),
        title: Center(child: Text('Todo List')),
      ),
      body: BlocBuilder<TodoCubit, List<String>>(
        builder: (context, state) {
          return ListView.builder(
            itemCount: state.length,
            itemBuilder: (context, index) {
              final todoText = state[index];
              return Padding(
                padding: const EdgeInsets.only(top: 5.0),
                child: Container(
                  color: Colors.amber,
                  child: ListTile(
                    title: Text(todoText),
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
          final task = await Navigator.of(context).push(
            MaterialPageRoute(
              builder: (BuildContext context) {
                return AddTodoScreen();
              },
            ),
          );
          if (task != null) {
            context.read<TodoCubit>().addTodoItem(task);
          }
        },
        tooltip: 'Add information',
        child: Icon(Icons.add),
      ),
    );
  }
}
