import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:todoapp/core/models/todo_model.dart';
import 'package:todoapp/core/models/user_model.dart';

class FirebaseFunctions {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  String? getCurrentUserId() {
    return _auth.currentUser?.uid;
  }

  Future<void> addTask(TodoModel todo) async {
    try {
      final userId = getCurrentUserId();
      if (userId != null) {
        await _firestore
            .collection("users")
            .doc(userId)
            .collection("todos")
            .doc(todo.id)
            .set(todo.toJson());
        print("Task added successfully: ${todo.title}");
      } else {
        print("No user logged in");
      }
    } catch (e) {
      print("Error adding task: $e");
      rethrow;
    }
  }

  Future<List<TodoModel>> getTasks() async {
    final userId = getCurrentUserId();
    if (userId == null) return [];

    List<TodoModel> userTodos = [];
    try {
      final userTodosSnapshot = await _firestore
          .collection("users")
          .doc(userId)
          .collection("todos")
          .orderBy('deadline')
          .get();

      for (var doc in userTodosSnapshot.docs) {
        userTodos.add(TodoModel.fromJson(doc.data()));
      }
      print("Loaded ${userTodos.length} tasks");
    } catch (e) {
      print("Error getting tasks: $e");
    }
    return userTodos;
  }

  // Real-time stream for tasks
  Stream<List<TodoModel>> getTasksStream() {
    final userId = getCurrentUserId();
    if (userId == null) {
      print("No user logged in for stream");
      return Stream.value([]);
    }

    return _firestore
        .collection("users")
        .doc(userId)
        .collection("todos")
        .orderBy('deadline')
        .snapshots()
        .map((snapshot) {
          return snapshot.docs
              .map((doc) => TodoModel.fromJson(doc.data()))
              .toList();
        });
  }

  Future<void> deleteTask(String taskId) async {
    try {
      final userId = getCurrentUserId();
      if (userId != null) {
        await _firestore
            .collection("users")
            .doc(userId)
            .collection("todos")
            .doc(taskId)
            .delete();
        print("Task deleted: $taskId");
      }
    } catch (e) {
      print("Error deleting task: $e");
      rethrow;
    }
  }

  Future<void> updateTask(TodoModel todo) async {
    try {
      final userId = getCurrentUserId();
      if (userId != null) {
        await _firestore
            .collection("users")
            .doc(userId)
            .collection("todos")
            .doc(todo.id)
            .update(todo.toJson());
        print("Task updated: ${todo.title}");
      }
    } catch (e) {
      print("Error updating task: $e");
      rethrow;
    }
  }

  Future<UserModel> signup(String name, String email, String password) async {
    UserCredential userdata = await _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    User user = userdata.user!;
    UserModel authModel = UserModel(
      username: name,
      email: email,
      id: user.uid,
      finshedTodos: 0,
      myTodosId: [],
    );

    try {
      await _firestore
          .collection('users')
          .doc(user.uid)
          .set(authModel.toJson());
    } catch (e) {
      print(e);
    }
    return authModel;
  }

  Future<UserModel> login(String email, String password) async {
    UserCredential userdata = await _auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    User user = userdata.user!;
    DocumentSnapshot snapshot = await _firestore
        .collection('users')
        .doc(user.uid)
        .get();
    return UserModel.fromJson(snapshot.data() as Map<String, dynamic>);
  }

  Future<void> logout() async {
    await _auth.signOut();
  }
}
