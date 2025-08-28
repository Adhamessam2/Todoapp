import 'dart:ui';

import 'package:todoapp/core/models/todo_model.dart';
import 'package:todoapp/core/models/user_model.dart';

abstract class GroupTaskState {}

class InitGroupTaskState extends GroupTaskState {}

class CurrentUser extends GroupTaskState {
  final UserModel currentUser;

  CurrentUser({required this.currentUser});
}

class TodosLoadedState extends GroupTaskState {
  final List<TodoModel> todos;
  TodosLoadedState({required this.todos});
}

class TodosLoading extends GroupTaskState {}

class DeleteTodoMain extends TodosLoadedState {
  final String message;
  final Color color;
  DeleteTodoMain({
    required this.color,
    required this.message,
    required super.todos,
  });
}

class TodosError extends GroupTaskState {
  final String error;

  TodosError({required this.error});
}
