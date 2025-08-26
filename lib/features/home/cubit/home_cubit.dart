import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoapp/core/data/firebase_functions.dart';
import 'package:todoapp/core/models/todo_model.dart';
import 'package:todoapp/core/models/user_model.dart';
import 'package:todoapp/features/home/cubit/home_status.dart';

class HomeCubit extends Cubit<HomeStatus> {
  HomeCubit() : super(InitHome()) {
    loadTodos();
  }
  late UserModel currentUser;
  final FirebaseFunctions _db = FirebaseFunctions();
  List<TodoModel> todos = [];
  Future<void> getCurrentUser() async {
    currentUser = await _db.getCurrentUser();
    emit(CurrentUser(currentUser: currentUser));
  }

  Future<void> loadTodos() async {
    getCurrentUser();
    todos = await _db.getTasks();
    print('currentUser.myTodosId[0]');
    print(currentUser.myTodosId[0]);
    emit(TodosLoadedState(todos: todos));
  }
}
