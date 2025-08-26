import 'package:todoapp/core/models/todo_model.dart';
import 'package:todoapp/core/models/user_model.dart';

abstract class HomeStatus {}

class InitHome extends HomeStatus {}

class CurrentUser extends HomeStatus {
  final UserModel currentUser;

  CurrentUser({required this.currentUser});
}

class TodosLoadedState extends InitHome {
  final List<TodoModel> todos;
  TodosLoadedState({required this.todos});
}

class ToggleTodo extends TodosLoadedState {
  final TodoModel todo;
  ToggleTodo({required this.todo, required super.todos}) : super();
}

class TodosError extends HomeStatus {
  final String error;

  TodosError({required this.error});
}
