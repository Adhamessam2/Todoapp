import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoapp/core/models/user_model.dart';
import 'package:todoapp/features/home/cubit/nav/nav_cubit.dart';
import 'package:todoapp/features/home/presentation/screens/main_screen.dart';
import 'package:todoapp/features/splash_screen/splash.dart';

class Authgate extends StatelessWidget {
  const Authgate({super.key});
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }
        if (!snapshot.hasData) {
          return Splashscreen();
        }
        return BlocProvider(
          create: (context) => NavCubit(),
          child: NavigationScreen(
            user: UserModel(
              username: "username",
              email: 'email',
              id: 'id',
              finshedTodos: 0,
              myTodosId: [],
            ),
          ),
        );
      },
    );
  }
}
