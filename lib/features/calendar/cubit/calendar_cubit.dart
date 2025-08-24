import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoapp/core/data/firebase_functions.dart';
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
    userTodos = await FirebaseFunctions().getTasks();
    emit(
      LoadingTasks(
        userTodos: userTodos,
        selectedDay: day,
        today: DateTime.now(),
      ),
    );
  }

  Future<void> loadingTasks() async {}
}
