import 'package:advanc_task_8/blocs/todo_bloc.dart';
import 'package:advanc_task_8/models/todo.dart';
import 'package:advanc_task_8/pages/add_todo_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TodoListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todo List'),
      ),
      body: BlocBuilder<TodoBloc, TodoState>(
        builder: (context, state) {
          if (state is TodoInitialState) {
            return Center(
              child: Text('No todos yet.'),
            );
          } else if (state is TodoLoadedState) {
            return ListView.builder(
              itemCount: state.todos.length,
              itemBuilder: (context, index) {
                final todo = state.todos[index];
                return ListTile(
                  title: Text(todo.title),
                  subtitle: Text(todo.description),
                  trailing: Checkbox(
                    value: todo.isCompleted,
                    onChanged: (value) {
                      final updatedTodo = todo.copyWith(isDone: value ?? false);
                      BlocProvider.of<TodoBloc>(context)
                          .add(UpdateTodoEvent(updatedTodo, index));
                    },
                  ),
                );
              },
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final result = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddTodoPage()),
          );
          if (result != null && result is Todo) {
            BlocProvider.of<TodoBloc>(context).add(AddTodoEvent(result));
          }
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
