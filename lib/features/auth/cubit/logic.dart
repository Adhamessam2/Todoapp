import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoapp/core/data/firebase_functions.dart';
import 'package:todoapp/features/auth/cubit/states.dart';

class Authlogic extends Cubit<AuthStates> {
  Authlogic() : super(AuthInitialState());

  FirebaseFunctions _firebaseFunctions = FirebaseFunctions();

  Future<void> signup(String name, String email, String password) async {
    emit(AuthLoadingState());
    try {
      final authModel = await _firebaseFunctions.signup(name, email, password);

      emit(AuthSuccessState(authModel));
    } catch (error) {
      emit(AuthsignupErrorState(error: error.toString()));
    }
  }

  Future<void> login(String email, String password) async {
    emit(AuthLoadingState());
    // final currentUser = FirebaseAuth.instance.currentUser;
    try {
      final authModel = await _firebaseFunctions.login(email, password);
      emit(AuthSuccessState(authModel));
    } catch (error) {
      emit(AuthloginErrorState(error: error.toString()));
    }
  }

  Future<void> logout() async {
    emit(AuthLoadingState());
    await _firebaseFunctions.logout();
    emit(AuthLogout());
  }
}
