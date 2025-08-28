import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoapp/core/style_manegares/colors.dart';
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
<<<<<<< HEAD
          if (state is AuthSuccessState) {
            final userinfo = state.authModel;
            return Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Appcolors.blue, Appcolors.navyblue],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.person,
                            color: Colors.black,
                            size: 30,
                          ),
                        ),
                      ),
                      SizedBox(width: 20),
                      Text(
                        "Hello ${userinfo.profile.username}",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ],
                  ),
                  Spacer(),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                    ),
                    onPressed: () {
                      cubit.logout();
                    },
                    child: Text("logout", style: TextStyle(color: Colors.red)),
                  ),
=======
          return Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Appcolors.navyblue,
                  Appcolors.blue,
                  Appcolors.lightblue,
>>>>>>> a6b70159989c401d3a6f79cea932b55517a39eea
                ],
              ),
            ),
            child: Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
                onPressed: () {
                  cubit.logout();
                },
                child: Text("logout", style: TextStyle(color: Colors.black)),
              ),
            ),
          );
        },
      ),
    );
  }
}
