import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoapp/core/data/firebase_functions.dart';
import 'package:todoapp/core/models/user_model.dart';

import 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final FirebaseFunctions _firebaseFunctions = FirebaseFunctions();

  AuthCubit() : super(AuthInitial());

  // SignUp
  Future<void> signUp(String name, String email, String password) async {
    emit(AuthLoading());
    try {
      final user = await _firebaseFunctions.signup(name, email, password);
      emit(AuthSuccess(user));
    } catch (e) {
      emit(AuthFailure(e.toString()));
    }
  }

  // Login
  Future<void> login(String email, String password) async {
    emit(AuthLoading());
    try {
      final UserModel user = await _firebaseFunctions.login(email, password);
      emit(AuthSuccess(user));
    } catch (e) {
      print('************************************');
      print(e.toString());

      emit(AuthFailure(e.toString()));
    }
  }

  // Logout
  Future<void> logout() async {
    emit(AuthLoading());
    try {
      await _firebaseFunctions.logout();
      emit(AuthInitial());
    } catch (e) {
      emit(AuthFailure(e.toString()));
    }
  }
}
