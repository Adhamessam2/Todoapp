import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
<<<<<<< HEAD
import 'package:todoapp/core/data/Appuser.dart';
=======
import 'package:todoapp/core/models/group_model.dart';
>>>>>>> a6b70159989c401d3a6f79cea932b55517a39eea
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

  Future<AppUser> signup(String name, String email, String password) async {
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
    return AppUser(firebaseUser: user, profile: authModel);
  }

  Future<AppUser> login(String email, String password) async {
    UserCredential userdata = await _auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    User user = userdata.user!;
    DocumentSnapshot snapshot = await _firestore
        .collection('users')
        .doc(user.uid)
        .get();

    if (!snapshot.exists) {
      throw Exception("User profile not found in Firestore");
    }
    UserModel authModel = UserModel.fromJson(
      snapshot.data() as Map<String, dynamic>,
    );
    return AppUser(firebaseUser: user, profile: authModel);
  }

  Future<void> logout() async {
    await _auth.signOut();
  }

  Future<void> addGroupTask(TodoModel todo, GroupModel groupModel) async {
    try {
      UserModel currentUser = await getCurrentUser();
      currentUser.myTodosId.add(todo.id);
      groupModel.tasksID.add(todo.id);
      await _firestore.collection("Todos").doc(todo.id).set(todo.toJson());
      await _firestore.collection('users').doc(currentUser.id).update({
        'myTodosId': currentUser.myTodosId,
      });
      await _firestore.collection('Groups').doc(groupModel.groupId).update({
        'tasksID': groupModel.tasksID,
      });
    } catch (e) {
      print(e);
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

  Future<void> deleteGroupTodo(
    TodoModel todo,
    UserModel user,
    GroupModel group,
  ) async {
    try {
      user.myTodosId.removeWhere((id) => id == todo.id);
      await _firestore.collection("users").doc(user.id).set(user.toJson());
      group.tasksID.removeWhere((id) => id == todo.id);
      await _firestore
          .collection("Groups")
          .doc(group.groupId)
          .set(group.toJson());
      await _firestore.collection("Todos").doc(todo.id).delete();
    } catch (e) {
      print(e);
    }
  }

  Future<List<TodoModel>> getGroupTodos(GroupModel group) async {
    try {
      List<TodoModel> userTodos = [];
      var usertodos = await _firestore.collection('Todos').get();
      for (var doc in usertodos.docs) {
        (group.tasksID.contains(doc.data()['id']))
            ? userTodos.add(TodoModel.fromJson(doc.data()))
            : null;
      }

      return userTodos;
    } catch (e) {
      print(e);
      return [];
    }
  }

  Future<void> toggolTodo(TodoModel todo) async {
    try {
      await _firestore.collection("Todos").doc(todo.id).set(todo.toJson());
      print(todo.id);
    } catch (e) {
      print(e);
    }
  }

  Future<void> deleteTodo(TodoModel todo) async {
    try {
      UserModel user = await getCurrentUser();
      user.myTodosId.removeWhere((id) => id == todo.id);
      await _firestore.collection("Todos").doc(todo.id).delete();
      await _firestore.collection("users").doc(user.id).set(user.toJson());
    } catch (e) {
      print(e);
    }
  }
}
