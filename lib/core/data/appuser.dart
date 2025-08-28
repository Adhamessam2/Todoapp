import 'package:firebase_auth/firebase_auth.dart';
import 'package:todoapp/core/models/user_model.dart';

class AppUser {
  final User firebaseUser; // from FirebaseAuth
  final UserModel profile; // from Firestore (your UserModel)

  AppUser({required this.firebaseUser, required this.profile});
}
