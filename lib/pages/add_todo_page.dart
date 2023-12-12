import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:advanc_task_8/blocs/cubit.dart';
import 'package:advanc_task_8/models/todo.dart';

class AddTodoScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    String name = "";
    String description = "";

    return Scaffold(
      appBar: AppBar(
        title: Text('Add Todo'),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              autofocus: true,
              onChanged: (value) {
                name = value;
              },
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a name';
                }
                return null;
              },
              decoration: InputDecoration(
                hintText: 'Enter the name',
                labelText: 'Name',
                contentPadding: const EdgeInsets.all(16.0),
              ),
            ),
            TextFormField(
              autofocus: true,
              onChanged: (value) {
                description = value;
              },
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a description';
                }
                return null;
              },
              decoration: InputDecoration(
                hintText: 'Enter the description',
                labelText: 'Description',
                contentPadding: const EdgeInsets.all(16.0),
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  final todo = Todo(
                    name: name,
                    description: description,
                  );
                  Navigator.of(context).pop(todo);
                }
              },
              child: Text('Add'),
            ),
          ],
        ),
      ),
    );
  }
}