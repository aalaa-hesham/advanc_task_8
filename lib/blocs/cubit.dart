import 'package:flutter_bloc/flutter_bloc.dart';

class TodoCubit extends Cubit<List<String>> {
  TodoCubit() : super([]);

  void addTodoItem(String data) {
    if (data.length > 0) {
      state.add(data);
      emit(List.from(state));
    }
  }

  void removeTodoItem(int index) {
    state.removeAt(index);
    emit(List.from(state));
  }
}