import 'package:todoapp/core/models/todo_model.dart';

abstract class CalendarStatus {}

class InitCalendar extends CalendarStatus {
  final DateTime selectedDay;
  final DateTime today;
  InitCalendar({required this.selectedDay, required this.today});
}

class LoadingTasks extends InitCalendar {
  final List<TodoModel> userTodos;

  LoadingTasks({required this.userTodos, required super.selectedDay, required super.today});
}
