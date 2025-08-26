import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoapp/core/style_manegares/colors.dart';
import 'package:todoapp/core/style_manegares/text_style.dart';
import 'package:todoapp/features/auth/cubit/auth_logic.dart';
import 'package:todoapp/features/auth/login/login_screen.dart';

class Startscreen1 extends StatelessWidget {
  final String imagepath;
  final String text;
  final bool lastpage;
  const Startscreen1({
    super.key,
    required this.imagepath,
    required this.text,
    required this.lastpage,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Appcolors.secColor, Appcolors.primaryColor],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 160),

              child: Image.asset(imagepath),
            ),
            SizedBox(height: 40),
            Text(text, style: CustmizedTextStyle.headerText),
            SizedBox(height: 200),
            if (lastpage)
              Padding(
                padding: const EdgeInsets.only(right: 50),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20, top: 30),
                      child: Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 2,
                              blurRadius: 7,
                            ),
                          ],
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30),
                        ),

                        child: IconButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => BlocProvider(
                                  create: (context) => AuthCubit(),
                                  child: LoginScreen(),
                                ),
                              ),
                            );
                          },
                          icon: Icon(Icons.check),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
