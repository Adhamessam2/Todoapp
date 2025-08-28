import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoapp/core/data/firebase_functions.dart';
import 'package:todoapp/core/models/group_model.dart';
import 'package:todoapp/core/models/todo_model.dart';
import 'package:todoapp/core/models/user_model.dart';
import 'package:todoapp/features/group/addgroupTasks/cubit/Add%20tasks&todos/todo_status.dart';

class GroupAddTodoCubit extends Cubit<GroupAddStates> {
  late UserModel currentUser;
  List<TodoModel> todos = [];
  DateTime deadline = DateTime.now();
  final FirebaseFunctions _db = FirebaseFunctions();
  GroupAddTodoCubit() : super(InitialState()) {
    loadTodos();
    getCurrentUser();
  }
  Future<void> getCurrentUser() async {
    currentUser = await _db.getCurrentUser();
  }

  Future<void> loadTodos() async {
    todos = await _db.getTasks();
    emit(TodosLoadedState(todos: todos));
  }

  void addGroupTask(TodoModel todo, GroupModel gr) {
    if (todo.title.isNotEmpty) {
      _db.addGroupTask(todo, gr);
      emit(TodoAddSucc(message: "add Successfully"));
    } else {
      emit(TodosError(error: "titile Can't be empty"));
    }
  }

  void selectDay(DateTime selectedDay) {
    emit(InitCalendarAdd(selectedDay: selectedDay, today: DateTime.now()));
  }

  List<TodoModel> userTodos = [];

  Future<void> loadingTasks() async {}
}
