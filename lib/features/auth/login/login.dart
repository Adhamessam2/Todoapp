import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoapp/core/style_manegares/colors.dart';
import 'package:todoapp/core/widegts/authgate.dart';
import 'package:todoapp/core/widegts/customform.dart';
import 'package:todoapp/features/auth/cubit/logic.dart';
import 'package:todoapp/features/auth/cubit/states.dart';
import 'package:todoapp/features/auth/onboarding_screen/widgets/icons.dart';
import 'package:todoapp/features/auth/signup/signup.dart';

class Loginscreen extends StatefulWidget {
  const Loginscreen({super.key});

  @override
  State<Loginscreen> createState() => _LoginscreenState();
}

class _LoginscreenState extends State<Loginscreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

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
        child: SafeArea(
          child: SingleChildScrollView(
            child: BlocConsumer<Authlogic, AuthStates>(
              listener: (context, state) {
                if (state is AuthSuccessState) {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => Authgate()),
                  );
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
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            ' Welcome Back to DO IT ',
                            style: TextStyle(
                              fontSize: screenSize.width * 0.06,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            'Have another productive day!',
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
                      key: _formKey,
                      child: Column(
                        children: [
                          Customtextformfield(
                            label: 'Email',
                            icon: Icons.email,
                            controller: emailController,
                            validator: (value) {
                              if (emailController.text.isEmpty) {
                                return 'Please enter your email';
                              }
                              if (!emailController.text.contains(
                                '@gmail.com',
                              )) {
                                return 'Please enter a valid email';
                              }
                              return null;
                            },
                            ispassword: false,
                          ),
                          SizedBox(height: screenSize.height * 0.02),
                          Customtextformfield(
                            label: 'Password',
                            icon: Icons.lock,
                            controller: passwordController,
                            validator: (value) {
                              if (passwordController.text.isEmpty) {
                                return 'Please enter your password';
                              }
                              if (passwordController.text.length < 6) {
                                return 'Password must be at least 6 characters';
                              }
                              return null;
                            },
                            ispassword: true,
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: screenSize.height * 0.01),
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {},
                        child: const Text(
                          'Forgot Password?',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),

                    SizedBox(height: screenSize.height * 0.02),

                    // Login button
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
                        if (_formKey.currentState!.validate()) {
                          cubit.login(
                            emailController.text,
                            passwordController.text,
                          );
                        }
                      },
                      child: Text(
                        'Login',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: screenSize.width * 0.05,
                        ),
                      ),
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Don’t have an account?',
                          style: TextStyle(color: Colors.white),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const Signupscreen(),
                              ),
                            );
                          },
                          child: Text(
                            'Sign Up',
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
                          'Sign in with :',
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
                            icon: const Icon(
                              Icons.facebook,
                              color: Colors.blue,
                            ),
                          ),
                        ),
                        SizedBox(width: screenSize.width * 0.02),
                        Customicons(
                          child: IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.apple, color: Colors.grey),
                          ),
                        ),
                        SizedBox(width: screenSize.width * 0.02),
                        Customicons(
                          child: IconButton(
                            icon: Image.asset(
                              'assets/Google.png',
                              height: 30,
                              width: 30,
                            ),
                            onPressed: () {},
                            iconSize: 30,
                          ),
                        ),
                      ],
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
