import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoapp/core/models/todo_model.dart';
import 'package:todoapp/features/addTasks/cubit/Add%20tasks&todos/todoStates.dart';

class TodoCubit extends Cubit<TodoState> {
  TodoCubit() : super(TodoInitial());

  List<TodoModel> tasks = [];

  void addTask(TodoModel task) {
    tasks.add(task);
    emit(TodoLoaded(List.from(tasks)));
  }

  void toggleComplete(String id) {
    final index = tasks.indexWhere((task) => task.id == id);
    if (index != -1) {
      final updatedTask = TodoModel(
        id: tasks[index].id,
        title: tasks[index].title,
        description: tasks[index].description,
        deadline: tasks[index].deadline,
        isCompleted: !tasks[index].isCompleted,
      );
      tasks[index] = updatedTask;
      emit(TodoLoaded(List.from(tasks)));
    }
  }

  void deleteTask(String id) {
    tasks.removeWhere((task) => task.id == id);
    emit(TodoLoaded(List.from(tasks)));
  }
}
