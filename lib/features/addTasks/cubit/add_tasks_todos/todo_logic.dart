import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoapp/core/data/firebase_functions.dart';
import 'package:todoapp/core/models/todo_model.dart';
import 'package:todoapp/core/models/todo_item_model.dart';
import 'package:todoapp/features/addTasks/cubit/add_tasks_todos/todo_states.dart';

class TodoCubit extends Cubit<TodoState> {
  final FirebaseFunctions _firebaseFunctions = FirebaseFunctions();
  StreamSubscription? _tasksSubscription;

  TodoCubit() : super(TodoInitial()) {
    _tasksSubscription = _firebaseFunctions.getTasksStream().listen(
      (tasks) {
        emit(TodoLoaded(tasks));
      },
      onError: (error) {
        emit(TodoError('Failed to load tasks: $error'));
      },
    );
  }

  @override
  Future<void> close() {
    _tasksSubscription?.cancel();
    return super.close();
  }

  Future<void> loadTasks() async {
  }

  Future<void> addTask(TodoModel task) async {
    try {
      await _firebaseFunctions.addTask(task);
    } catch (e) {
      emit(TodoError('Failed to add task: $e'));
    }
  }

  Future<void> toggleComplete(String id) async {
    try {
      if (state is TodoLoaded) {
        final currentTasks = (state as TodoLoaded).tasks;
        final taskIndex = currentTasks.indexWhere((task) => task.id == id);

        if (taskIndex != -1) {
          final task = currentTasks[taskIndex];
          final updatedTask = task.copyWith(isCompleted: !task.isCompleted);
          await _firebaseFunctions.updateTask(updatedTask);
        }
      }
    } catch (e) {
      print("Error in toggleComplete: $e");
      emit(TodoError('Failed to toggle task completion: $e'));
    }
  }

  Future<void> deleteTask(String id) async {
    try {
      await _firebaseFunctions.deleteTask(id);
    } catch (e) {
      emit(TodoError('Failed to delete task: $e'));
    }
  }

  Future<void> updateTask(TodoModel updatedTask) async {
    try {
      await _firebaseFunctions.updateTask(updatedTask);
    } catch (e) {
      emit(TodoError('Failed to update task: $e'));
    }
  }

  Future<void> addTodoToTask(String taskId, TodoItem newTodo) async {
    try {
      if (state is TodoLoaded) {
        final currentTasks = (state as TodoLoaded).tasks;
        final taskIndex = currentTasks.indexWhere((task) => task.id == taskId);

        if (taskIndex != -1) {
          final task = currentTasks[taskIndex];
          final updatedTodos = List<TodoItem>.from(task.todos)..add(newTodo);
          final updatedTask = task.copyWith(todos: updatedTodos);
          await _firebaseFunctions.updateTask(updatedTask);
        }
      }
    } catch (e) {
      emit(TodoError('Failed to add todo to task: $e'));
    }
  }

  Future<void> toggleTodoCompletion(String taskId, String todoId) async {
    try {
      if (state is TodoLoaded) {
        final currentTasks = (state as TodoLoaded).tasks;
        final taskIndex = currentTasks.indexWhere((task) => task.id == taskId);

        if (taskIndex != -1) {
          final task = currentTasks[taskIndex];
          final todoIndex = task.todos.indexWhere((todo) => todo.id == todoId);

          if (todoIndex != -1) {
            final todo = task.todos[todoIndex];
            final updatedTodo = todo.copyWith(isCompleted: !todo.isCompleted);
            final updatedTodos = List<TodoItem>.from(task.todos);
            updatedTodos[todoIndex] = updatedTodo;
            final updatedTask = task.copyWith(todos: updatedTodos);
            await _firebaseFunctions.updateTask(updatedTask);
          }
        }
      }
    } catch (e) {
      emit(TodoError('Failed to toggle todo completion: $e'));
    }
  }
}
