// ignore_for_file: avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:todoapp/core/models/group_model.dart';
import 'package:todoapp/core/models/todo_model.dart';
import 'package:todoapp/core/models/user_model.dart';

class FirebaseFunctions {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  Future<void> addTask(TodoModel todo) async {
    try {
      UserModel currentUser = await getCurrentUser();
      currentUser.myTodosId.add(todo.id);
      await _firestore.collection("Todos").doc(todo.id).set(todo.toJson());
      await _firestore.collection('users').doc(currentUser.id).update({
        'myTodosId': currentUser.myTodosId,
      });
    } catch (e) {
      print(e);
    }
  }

  Future<List<TodoModel>> getTasks() async {
    try {
      UserModel currentUSer = await getCurrentUser();
      List<TodoModel> userTodos = [];
      var usertodos = await _firestore.collection('Todos').get();
      for (var doc in usertodos.docs) {
        (currentUSer.myTodosId.contains(doc.data()['id']))
            ? userTodos.add(TodoModel.fromJson(doc.data()))
            : null;
      }

      return userTodos;
    } catch (e) {
      print(e);
      return [];
    }
  }

  Future<UserModel> signup(
    String username,
    String email,
    String password,
  ) async {
    UserCredential userdata = await _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    User user = userdata.user!;
    UserModel newUser = UserModel(
      email: email,
      finshedTodos: 0,
      id: user.uid,
      myTodosId: [],
      username: username,
    );
    try {
      await _firestore.collection('users').doc(user.uid).set(newUser.toJson());
    } catch (e) {
      print(e);
    }
    return newUser;
  }

  Future<UserModel> login(String email, String password) async {
    try {
      UserCredential userdata = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      User user = userdata.user!;
      DocumentSnapshot snapshot = await _firestore
          .collection('users')
          .doc(user.uid)
          .get();
      UserModel currentUSer = UserModel.fromJson(
        snapshot.data() as Map<String, dynamic>,
      );
      return currentUSer;
    } catch (e) {
      print(e);
      return UserModel(
        username: '',
        email: '',
        id: '',
        finshedTodos: 0,
        myTodosId: [],
      );
    }
  }

  Future<UserModel> getCurrentUser() async {
    try {
      User user = _auth.currentUser!;
      DocumentSnapshot snapshot = await _firestore
          .collection('users')
          .doc(user.uid)
          .get();
      UserModel currentUSer = UserModel.fromJson(
        snapshot.data() as Map<String, dynamic>,
      );
      return currentUSer;
    } catch (e) {
      print(e);
      return UserModel(
        username: '',
        email: '',
        id: '',
        finshedTodos: 0,
        myTodosId: [],
      );
    }
  }

  Future<UserModel> getUserByID(String id) async {
    try {
      DocumentSnapshot snapshot = await _firestore
          .collection('users')
          .doc(id)
          .get();
      UserModel userById = UserModel.fromJson(
        snapshot.data() as Map<String, dynamic>,
      );
      return userById;
    } catch (e) {
      return UserModel(
        username: '',
        email: "",
        id: "",
        finshedTodos: 0,
        myTodosId: [],
      );
    }
  }

  Future<void> logout() async {
    await _auth.signOut();
  }

  Future<void> addGroup(GroupModel group) async {
    try {
      UserModel currentUser = await getCurrentUser();
      currentUser.myTodosId;
      await _firestore
          .collection("Groups")
          .doc(group.groupId)
          .set(group.toJson());
    } catch (e) {
      print(e);
    }
  }

  Future<List<GroupModel>> getGroups() async {
    try {
      UserModel currentUser = await getCurrentUser();
      List<GroupModel> groups = [];
      var groupsTemp = await _firestore.collection('Groups').get();
      for (var doc in groupsTemp.docs) {
        GroupModel testGroup = GroupModel.fromJson(doc.data());
        if (testGroup.membersID.contains(currentUser.id)) {
          groups.add(testGroup);
        }
      }
      print(groups.length);
      return groups
          .where((group) => group.membersID.contains(currentUser.id))
          .toList();
    } catch (e) {
      print(e);
      return [];
    }
  }
}
