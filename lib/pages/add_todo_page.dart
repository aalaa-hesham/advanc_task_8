import 'package:advanc_task_8/blocs/todo_bloc.dart';
import 'package:advanc_task_8/models/todo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter/material.dart';

class AddTodoScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    String task = "";
    //String task2 = "";

    return Scaffold(
      appBar: AppBar(
        title: Text('your information'),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              autofocus: true,
              onChanged: (value) {
                task = value;
              },
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'your name ';
                }
                return null;
              },
              decoration: InputDecoration(
                hintText: 'the name',
                label: Text("Name"),
                contentPadding: const EdgeInsets.all(16.0),
              ),
            ),
            TextFormField(
              autofocus: true,
              onChanged: (value2) {
                //task2 = value2;
              },
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'your description ';
                }
                return null;
              },
              decoration: InputDecoration(
                hintText: 'your description',
                label: Text("Description"),
                contentPadding: const EdgeInsets.all(16.0),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  Navigator.of(context).pop(task);
                  //   Navigator.of(context).pop(task2);
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
