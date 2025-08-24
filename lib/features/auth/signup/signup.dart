import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoapp/core/style_manegares/colors.dart';
import 'package:todoapp/features/auth/cubit/logic.dart';
import 'package:todoapp/features/auth/cubit/states.dart';
import 'package:todoapp/features/auth/login/login.dart';
import 'package:todoapp/features/home/presentation/screens/home_screen.dart';
import '../../../core/widegts/customform.dart';
import '../onboarding_screen/widgets/icons.dart';

class Signupscreen extends StatefulWidget {
  const Signupscreen({super.key});

  @override
  State<Signupscreen> createState() => _SignupscreenState();
}

class _SignupscreenState extends State<Signupscreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size; // Get screen size

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Appcolors.blue, Appcolors.navyblue],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: ListView(
          children: [
            BlocConsumer<Authlogic, AuthStates>(
              listener: (context, state) {
                if (state is AuthSuccessState) {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => HomeScreen()),
                  );
                }
                if (state is AuthErrorState) {
                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(SnackBar(content: Text(state.error)));
                }
              },
              builder: (context, state) {
                final cubit = context.read<Authlogic>();

                return Column(
                  children: [
                    SizedBox(height: screenSize.height * 0.05),
                    Image.asset('assets/Checkmark.png'),
                    SizedBox(height: screenSize.height * 0.05),
                    Padding(
                      padding: EdgeInsets.only(right: screenSize.width * 0.2),
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                              right: screenSize.width * 0.2,
                            ),
                            child: Text(
                              'Welcome to DO IT ',
                              style: TextStyle(
                                fontSize: screenSize.width * 0.06,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          Text(
                            'create an account and Join us now!',
                            style: TextStyle(
                              fontSize: screenSize.width * 0.045,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: screenSize.height * 0.03),
                    Form(
                      key: formkey,
                      child: Column(
                        children: [
                          Customtextformfield(
                            label: 'Name',
                            icon: Icons.person,
                            controller: nameController,
                            validator: (value) {
                              if (nameController.text.isEmpty) {
                                return 'Please enter your name';
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: screenSize.height * 0.02),
                          Customtextformfield(
                            label: 'Email',
                            icon: Icons.email,
                            controller: emailController,
                            validator: (value) {
                              if (emailController.text.isEmpty) {
                                return 'Please enter your email';
                              }
                              if (emailController.text.contains('@gmail.com') ==
                                  false) {
                                return 'Please enter a valid email';
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: screenSize.height * 0.02),
                          Customtextformfield(
                            label: 'Password',
                            icon: Icons.lock,
                            controller: passwordController,
                            validator: (vlue) {
                              if (passwordController.text.isEmpty) {
                                return 'Please enter your password';
                              }
                              if (passwordController.text.length < 6) {
                                return 'Password must be at least 6 characters';
                              }
                              return null;
                            },
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: screenSize.height * 0.01),
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {},
                        child: Text(
                          'Forgot Password?',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    SizedBox(height: screenSize.height * 0.01),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Appcolors.lightblue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        fixedSize: Size(
                          screenSize.width * 0.9,
                          screenSize.height * 0.07,
                        ),
                      ),
                      onPressed: () {
                        if (formkey.currentState!.validate()) {
                          cubit.signup(
                            nameController.text,
                            emailController.text,
                            passwordController.text,
                          );
                        }
                      },
                      child: Text(
                        'Sign Up',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: screenSize.width * 0.05,
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,

                      children: [
                        Text(
                          'Already have an account?',
                          style: TextStyle(color: Colors.white),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Loginscreen(),
                              ),
                            );
                          },
                          child: Text(
                            'Sign In',
                            style: TextStyle(color: Appcolors.lightblue),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: screenSize.height * 0.05),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Sign Up with :',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: screenSize.width * 0.045,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(width: screenSize.width * 0.02),
                        Customicons(
                          child: IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.facebook, color: Colors.blue),
                          ),
                        ),
                        SizedBox(width: screenSize.width * 0.02),
                        Customicons(
                          child: IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.apple, color: Colors.grey),
                          ),
                        ),
                        SizedBox(width: screenSize.width * 0.02),
                        Customicons(
                          child: IconButton(
                            icon: Image.asset(
                              'assets/Google.png',
                              height: screenSize.width * 0.07,
                              width: screenSize.width * 0.07,
                            ),
                            onPressed: () {},
                            iconSize: screenSize.width * 0.07,
                          ),
                        ),
                      ],
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
