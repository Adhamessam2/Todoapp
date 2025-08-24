import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todoapp/core/models/todo_model.dart';
import 'package:todoapp/core/models/user_model.dart';

class FirebaseFunctions {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  UserModel user = UserModel(
    username: "Soliman",
    email: 'ragabsoliman',
    id: "asdw",
    finshedTodos: 0,
    myTodosId: ['2', '3'],
  );
  Future<void> addTask(TodoModel todo) async {
    await _firestore.collection("Todos").doc(todo.id).set(todo.toJson());
  }

  Future<List<TodoModel>> getTasks() async {
    List<TodoModel> userTodos = [];
    var usertodos = await _firestore.collection('Todos').get();
    for (var doc in usertodos.docs) {
      (user.myTodosId.contains(doc.data()['id']))
          ? userTodos.add(TodoModel.fromJson(doc.data()))
          : null;
    }
    return userTodos;
  }
}
