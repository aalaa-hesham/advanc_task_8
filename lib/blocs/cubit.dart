import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:advanc_task_8/models/todo.dart';

class TodoCubit extends Cubit<List<Todo>> {
  TodoCubit() : super([]);

  void addTodoItem(Todo todo) {
    final updatedList = [...state, todo];
    emit(updatedList);
  }

  void removeTodoItem(int index) {
    final updatedList = [...state];
    updatedList.removeAt(index);
    emit(updatedList);
  }
}