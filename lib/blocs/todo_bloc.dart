import 'package:advanc_task_8/models/todo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class TodoEvent extends Equatable {
  const TodoEvent();

  @override
  List<Object> get props => [];
}

class AddTodoEvent extends TodoEvent {
  final Todo todo;

  const AddTodoEvent(this.todo);

  @override
  List<Object> get props => [todo];
}

class UpdateTodoEvent extends TodoEvent {
  final Todo updatedTodo;
  final int index;

  const UpdateTodoEvent(this.updatedTodo, this.index);

  @override
  List<Object> get props => [updatedTodo, index];
}

class TodoState extends Equatable {
  const TodoState();

  @override
  List<Object> get props => [];
}

class TodoInitialState extends TodoState {}

class TodoLoadedState extends TodoState {
  final List<Todo> todos;

  const TodoLoadedState(this.todos);

  @override
  List<Object> get props => [todos];
}

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  List<Todo> todos = [];

  TodoBloc() : super(TodoInitialState());

  @override
  Stream<TodoState> mapEventToState(TodoEvent event) async* {
    if (event is AddTodoEvent) {
      todos.add(event.todo);
      yield TodoLoadedState(todos);
    } else if (event is UpdateTodoEvent) {
      if (event.index >= 0 && event.index < todos.length) {
        todos[event.index] = event.updatedTodo;
        yield TodoLoadedState(todos);
      }
    }
  }
}