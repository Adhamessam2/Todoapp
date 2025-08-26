import 'package:todoapp/core/models/user_model.dart';

abstract class AuthStates {}

class AuthInitialState extends AuthStates {}

class AuthLoadingState extends AuthStates {}

class AuthSuccessState extends AuthStates {
  final UserModel authModel;
  AuthSuccessState({required this.authModel});
}

class AuthErrorState extends AuthStates {
  final String error;
  AuthErrorState({required this.error});
}

class AuthLogout extends AuthStates {}
