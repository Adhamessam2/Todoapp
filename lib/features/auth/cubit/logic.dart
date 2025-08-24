import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoapp/core/data/firebase_functions.dart';
import 'package:todoapp/features/auth/cubit/states.dart';

class Authlogic extends Cubit<AuthStates> {
  Authlogic() : super(AuthInitialState());

  FirebaseFunctions _firebaseFunctions = FirebaseFunctions();

  Future<void> signup(String email, String password, String name) async {
    emit(AuthLoadingState());
    try {
      final result = await _firebaseFunctions.signup(email, password, name);

      emit(AuthSuccessState(authModel: result));
    } catch (error) {
      emit(AuthErrorState(error: error.toString()));
    }
  }

  Future<void> login(String email, String password) async {
    emit(AuthLoadingState());
    try {
      final result = await _firebaseFunctions.login(email, password);
      emit(AuthSuccessState(authModel: result));
    } catch (error) {
      emit(AuthErrorState(error: error.toString()));
    }
  }
}
