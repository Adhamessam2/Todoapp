import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoapp/core/data/firebase_functions.dart';
import 'package:todoapp/core/models/todo_model.dart';
import 'package:todoapp/features/group/todo_details/cubit/todo_details_status.dart';

class TodoDetailsCubit extends Cubit<TodoDetailsStatus> {
  TodoDetailsCubit() : super(InitTodoDetails());
  final FirebaseFunctions _db = FirebaseFunctions();
  Future<void> toggolTodo(TodoModel todo) async {
    todo.isCompleted = !todo.isCompleted;
    await _db.toggolTodo(todo);
    if (todo.isCompleted) {
      emit(ToggolTodo(message: "Congrats you made it 🙌", color: Colors.green));
    } else {
      emit(
        ToggolTodo(
          message: "Carry on.\n you can make it 🤞😉",
          color: Colors.orange,
        ),
      );
    }
  }

  Future<void> deleteTodo(TodoModel todo) async {
    await _db.deleteTodo(todo);
    emit(
      DeleteTodo(message: "Todo is Deleted Successfully", color: Colors.green),
    );
  }
}
