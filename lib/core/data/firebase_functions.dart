import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:todoapp/core/models/todo_model.dart';
import 'package:todoapp/core/models/user_model.dart';

class FirebaseFunctions {
  final FirebaseAuth _auth = FirebaseAuth.instance;
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

  Future<UserModel> signup(String name, String email, String password) async {
    UserCredential userdata = await _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    User user = userdata.user!;
    UserModel userModel = UserModel(
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
          .set(userModel.toJson());
    } catch (e) {
      print(e);
    }
    return userModel;
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
