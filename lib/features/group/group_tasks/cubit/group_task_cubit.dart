import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoapp/core/data/firebase_functions.dart';
import 'package:todoapp/core/models/group_model.dart';
import 'package:todoapp/core/models/todo_model.dart';
import 'package:todoapp/core/models/user_model.dart';
import 'package:todoapp/features/group/group_tasks/cubit/group_task_state.dart';

class GroupTaskCubit extends Cubit<GroupTaskState> {
  GroupTaskCubit() : super(InitGroupTaskState());

  late UserModel currentUser;
  final FirebaseFunctions _db = FirebaseFunctions();
  List<TodoModel> todos = [];
  Future<void> getCurrentUser() async {
    currentUser = await _db.getCurrentUser();
    emit(CurrentUser(currentUser: currentUser));
  }

  Future<void> loadGroupTodos(GroupModel group) async {
    emit(TodosLoading());
    todos = await _db.getGroupTodos(group);
    emit(TodosLoadedState(todos: todos));
  }

  Future<void> deleteGroupTodo(TodoModel todo, GroupModel group) async {
    getCurrentUser();
    emit(TodosLoading());
    await _db.deleteGroupTodo(todo, currentUser, group);
    loadGroupTodos(group);
    emit(
      DeleteTodoMain(
        message: "Todo is Deleted Successfully",
        color: Colors.green,
        todos: todos,
      ),
    );
  }
}
