import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoapp/core/data/firebase_functions.dart';
import 'package:todoapp/core/models/todo_model.dart';
import 'package:todoapp/features/addTasks/cubit/Add%20tasks&todos/todo_status.dart';

class TodoCubit extends Cubit<States> {
  List<TodoModel> todos = [];
  final FirebaseFunctions _db = FirebaseFunctions();
  TodoCubit() : super(InitialState()) {
    loadTodos();
  }

  // Future updateTodo(TodoModel todo) async {
  //   if (todo.title.isNotEmpty) {
  //     db.updateTodo(todo);
  //     todos = db.getTodo();
  //     emit(UpdateTodo(todos: todos));
  //   } else {
  //     emit(TodosError(error: "The taske can't be Empty"));
  //   }
  // }

  Future<void> loadTodos() async {
    // todos = await _db.getTasks();
    emit(TodosLoadedState(todos: todos));
  }

  // void toggle(String id) {
  //   if (id.isNotEmpty) {
  //     final index = todos.indexWhere((todo) => todo.id == id);
  //     if (index == -1) {
  //       emit(TodosError(error: "Can't detect an id"));
  //     } else {
  //       todos[index].isDone = !todos[index].isDone;
  //       db.updateTodo(todos[index]);
  //       emit(ToggleTodo(todo: todos[index], todos: todos));
  //     }
  //   } else {
  //     emit(TodosError(error: "Can't detect an id"));
  //   }
  // }

  //   void deleteTodo(String id) {
  //     if (id.isNotEmpty) {
  //       db.deleteTodo(id);
  //       todos = db.getTodo();
  //       emit(DeleteTodo(todos: todos));
  //     } else {
  //       emit(TodosError(error: "Can't detect an id"));
  //     }
  //   }
}
