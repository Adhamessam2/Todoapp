import 'package:todoapp/core/models/todo_model.dart';

abstract class States {}

class InitialState extends States {}

class TodosLoadedState extends States {
  final List<TodoModel> todos;
  TodosLoadedState({required this.todos});
}

class UpdateTodo extends TodosLoadedState {
  UpdateTodo({required super.todos}) : super();
}

class DeleteTodo extends TodosLoadedState {
  DeleteTodo({required super.todos}) : super();
}

class ToggleTodo extends TodosLoadedState {
  final TodoModel todo;
  ToggleTodo({required this.todo, required super.todos}) : super();
}

class TodosError extends States {
  final String error;

  TodosError({required this.error});
}
