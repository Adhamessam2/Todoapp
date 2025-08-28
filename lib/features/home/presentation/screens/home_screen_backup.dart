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
              child: Padding(
                padding: const EdgeInsets.all(30.0),
                child: SafeArea(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
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
                          Column(
                            children: [
                              Text(
                                "Hello ${userinfo.profile.username}",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 25,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              SizedBox(height: 5),
                              Text(
                                "${userinfo.profile.email}",

                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 25,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
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
                        child: Text(
                          "logout",
                          style: TextStyle(color: Colors.red),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }
          return Center(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
              onPressed: () {
                cubit.logout();
              },
              child: Text("logout", style: TextStyle(color: Colors.black)),
            ),
          );
        },
      ),
    );
  }
}
