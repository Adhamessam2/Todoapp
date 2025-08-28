import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:todoapp/core/models/user_model.dart';

class ProfileService {
  static Future<UserModel?> getUserData() async {
    User? firebaseUser = FirebaseAuth.instance.currentUser;
    if (firebaseUser == null) return null;

    DocumentSnapshot snapshot = await FirebaseFirestore.instance
        .collection("users")
        .doc(firebaseUser.uid)
        .get();

    if (!snapshot.exists) return null;

    final data = snapshot.data() as Map<String, dynamic>;

    final todos =
        (data["myTodosId"] as List<dynamic>?)
            ?.map((e) => e.toString())
            .toList() ??
        [];

    final finished = data["finshedTodos"] is int
        ? data["finshedTodos"]
        : int.tryParse(data["finshedTodos"]?.toString() ?? "0") ?? 0;

    return UserModel(
      id: data["id"] ?? firebaseUser.uid,
      email: data["email"] ?? "",
      username: data["username"] ?? "",
      myTodosId: todos,
      finshedTodos: finished,
    );
  }
}
