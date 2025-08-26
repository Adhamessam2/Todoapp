import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoapp/core/style_manegares/colors.dart';
import 'package:todoapp/core/style_manegares/text_style.dart';
import 'package:todoapp/core/widgets/authgate.dart';
import '../cubit/auth_logic.dart';
import '../cubit/auth_state.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_textfeild.dart';

// ignore: must_be_immutable
class SignupScreen extends StatelessWidget {
  SignupScreen({super.key});

  final formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: true, // مهم عشان الكيبورد
      body: Container(
        height: height,
        decoration: BoxDecoration(gradient: Appcolors.background),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: BlocConsumer<AuthCubit, AuthState>(
            listener: (context, state) {
              if (state is AuthSuccess) {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => Authgate()),
                );
              }
            },
            builder: (context, state) {
              final cubit = context.read<AuthCubit>();
              return SingleChildScrollView(
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 40),
                      Text('Sign Up', style: CustmizedTextStyle.headerText),
                      SizedBox(height: 40),
                      CustomTextfaield(
                        controller: emailController,
                        icon: Icon(Icons.email),
                        obscure: false,
                        label: 'Email',
                        validate: (value) {
                          if (value == null || value.isEmpty) {
                            return "Email is required";
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 30),
                      CustomTextfaield(
                        controller: userNameController,
                        icon: Icon(Icons.person),
                        obscure: false,
                        label: 'Username',
                        validate: (value) {
                          if (value == null || value.isEmpty) {
                            return "Username is required";
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 30),
                      CustomTextfaield(
                        controller: passwordController,
                        icon: Icon(Icons.key),
                        obscure: true,
                        label: 'Password',
                        validate: (value) {
                          if (value == null ||
                              value.isEmpty ||
                              value.length < 6) {
                            return "Password must be at least 6 characters";
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 70),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text(
                            'Already have an account?',
                            style: CustmizedTextStyle.headerText.copyWith(
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ),
                      CustomButton(
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            cubit.signUp(
                              userNameController.text,
                              emailController.text,
                              passwordController.text,
                            );
                          }
                        },
                        title: 'Sign Up',
                      ),
                      SizedBox(height: 20),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
