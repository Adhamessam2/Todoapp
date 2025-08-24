import 'package:todoapp/core/models/todo_model.dart';

abstract class TodoState {}

class TodoInitial extends TodoState {}

class TodoLoaded extends TodoState {
  final List<TodoModel> tasks;
  TodoLoaded(this.tasks);
}
