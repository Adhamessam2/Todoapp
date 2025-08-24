import 'package:todoapp/features/auth/models/authmodel.dart';

abstract class AuthStates {}

class AuthInitialState extends AuthStates {}

class AuthLoadingState extends AuthStates {}

class AuthSuccessState extends AuthStates {
  final AuthModel authModel;
  AuthSuccessState({required this.authModel});
}

class AuthErrorState extends AuthStates {
  final String error;
  AuthErrorState({required this.error});
}
