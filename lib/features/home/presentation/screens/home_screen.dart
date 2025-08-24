import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoapp/core/widegts/authgate.dart';
import 'package:todoapp/features/auth/cubit/logic.dart';
import 'package:todoapp/features/auth/cubit/states.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<Authlogic, AuthStates>(
        listener: (context, state) {
          if (state is AuthLogout) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => Authgate()),
            );
          }
        },
        builder: (context, state) {
          final cubit = context.read<Authlogic>();
          return Center(
            child: TextButton(
              onPressed: () {
                cubit.logout();
              },
              child: Text("logout"),
            ),
          );
        },
      ),
    );
  }
}
