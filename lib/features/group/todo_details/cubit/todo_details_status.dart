import 'dart:ui';

abstract class TodoDetailsStatus {}

class InitTodoDetails extends TodoDetailsStatus {}

class ToggolTodo extends TodoDetailsStatus {
  final String message;
  final Color color;
  ToggolTodo({required this.color, required this.message});
}
class DeleteTodo extends TodoDetailsStatus {
  final String message;
  final Color color;
  DeleteTodo({required this.color, required this.message});
}
