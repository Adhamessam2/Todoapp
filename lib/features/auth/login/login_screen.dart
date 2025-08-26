import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoapp/core/style_manegares/colors.dart';
import 'package:todoapp/core/style_manegares/text_style.dart';
import 'package:todoapp/core/widgets/authgate.dart';
import 'package:todoapp/features/auth/cubit/auth_logic.dart';
import 'package:todoapp/features/auth/cubit/auth_state.dart';
import '../signup/signup_screen.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_textfeild.dart';

// ignore: must_be_immutable
class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(gradient: Appcolors.background),
        child: Padding(
          padding: EdgeInsetsGeometry.all(15),
          child: BlocConsumer<AuthCubit, AuthState>(
            builder: (context, state) {
              final cubit = context.read<AuthCubit>();
              return Form(
                key: formKey,
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 40),
                      Text('login', style: CustmizedTextStyle.headerText),
                      SizedBox(height: 40),
                      CustomTextfaield(
                        controller: emailController,
                        icon: Icon(Icons.email),
                        obscure: false,
                        label: 'email',
                        validate: (value) {
                          if (value == null || value.isEmpty) {
                            return "Email is required";
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 30),
                      CustomTextfaield(
                        obscure: true,
                        controller: passwordController,
                        icon: Icon(Icons.key),
                        label: 'passord',
                        validate: (value) {
                          if (value == null ||
                              value.isEmpty ||
                              value.length < 6) {
                            return "pasword is required";
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 70),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => BlocProvider(
                                  create: (context) => AuthCubit(),
                                  child: SignupScreen(),
                                ),
                              ),
                            );
                          },
                          child: Text(
                            'Create an account',
                            style: CustmizedTextStyle.headerText.copyWith(
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ),
                      CustomButton(
                        onPressed: () {
                          cubit.login(
                            emailController.text,
                            passwordController.text,
                          );
                        },
                        title: 'Login',
                      ),
                    ],
                  ),
                ),
              );
            },
            listener: (context, state) {
              if (state is AuthSuccess) {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => Authgate()),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
