import 'package:advanc_task_8/blocs/todo_bloc.dart';
import 'package:advanc_task_8/models/todo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class AddTodoPage extends StatelessWidget {
  late TextEditingController _titleController = TextEditingController();
  late TextEditingController _descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Todo'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _titleController,
              decoration: InputDecoration(
                labelText: 'Title',
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: _descriptionController,
              decoration: InputDecoration(
                labelText: 'Description',
              ),
            ),
            SizedBox(height: 16.0),
        ElevatedButton(
                onPressed: () {
                  final title = _titleController.text;
                  final description = _descriptionController.text;
                  final todo = Todo(
                    title: title,
                    description: description,
                  );
                  BlocProvider.of<TodoBloc>(context).add(AddTodoEvent(todo));
                },
                child: Text('Add'),
              ),
          ],
        ),
      ),
    );
  }
}