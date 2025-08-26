import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoapp/core/data/firebase_functions.dart';
import 'package:todoapp/core/models/todo_model.dart';
import 'package:todoapp/core/models/user_model.dart';
import 'package:todoapp/features/addTasks/cubit/Add%20tasks&todos/todo_status.dart';

class TodoCubit extends Cubit<States> {
  late UserModel currentUser;
  List<TodoModel> todos = [];
  DateTime deadline = DateTime.now();
  final FirebaseFunctions _db = FirebaseFunctions();
  TodoCubit() : super(InitialState()) {
    loadTodos();
    getCurrentUser();
  }
  Future<void> getCurrentUser() async {
    currentUser = await _db.getCurrentUser();
  }

  Future updateTodo(TodoModel todo, List<dynamic> todoIdList) async {
    if (todo.title.isNotEmpty) {
      _db.addTask(todo);
      todos = await _db.getTasks();
      emit(UpdateTodo(todos: todos));
    } else {
      emit(TodosError(error: "The taske can't be Empty"));
    }
  }

  Future<void> loadTodos() async {
    // todos = await _db.getTasks();
    emit(TodosLoadedState(todos: todos));
  }

  void addTask(TodoModel todo) {
    _db.addTask(todo);
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
