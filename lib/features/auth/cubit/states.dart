import 'package:todoapp/core/data/Appuser.dart';

abstract class AuthStates {}

class AuthInitialState extends AuthStates {}

class AuthLoadingState extends AuthStates {}

class AuthSuccessState extends AuthStates {
  final AppUser authModel;
  AuthSuccessState(this.authModel);
}

class AuthloginErrorState extends AuthStates {
  final String error;
  AuthloginErrorState({required this.error});
}

class AuthsignupErrorState extends AuthStates {
  final String error;
  AuthsignupErrorState({required this.error});
}

class AuthLogout extends AuthStates {}
