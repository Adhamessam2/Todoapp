import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoapp/core/models/todo_model.dart';
import 'calendar_status.dart';

class CalendarCubit extends Cubit<CalendarStatus> {
  CalendarCubit()
    : super(InitCalendar(selectedDay: DateTime.now(), today: DateTime.now()));

  void selectDay(DateTime selectedDay) {
    emit(InitCalendar(selectedDay: selectedDay, today: DateTime.now()));
  }

  List<TodoModel> userTodos = [];

  Future<void> showTasks(DateTime day) async {
    List<TodoModel> userTodosBytime = [];
    // userTodos = await FirebaseFunctions().getTasks();
    for (var todo in userTodos) {
      String daedlin = todo.deadline.toString().split(' ')[0];
      daedlin == day.toString().split(' ')[0]
          ? userTodosBytime.add(todo)
          : null;
    }

    emit(
      LoadingTasks(
        userTodos: userTodosBytime,
        selectedDay: day,
        today: DateTime.now(),
      ),
    );
  }

  Future<void> loadingTasks() async {}
}
