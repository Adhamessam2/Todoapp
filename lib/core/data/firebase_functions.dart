import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todoapp/core/models/todo_model.dart';

class FirebaseFunctions {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> addTask(TodoModel todo) async {
    await _firestore.collection("Todos").doc(todo.id).set(todo.toJson());
  }
}
