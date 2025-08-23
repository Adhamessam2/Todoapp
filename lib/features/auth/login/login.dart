import 'package:flutter/material.dart';
import 'package:todoapp/core/style_manegares/colors.dart';
import 'package:todoapp/core/widegts/customform.dart';
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
        child: Column(
          children: [
            SizedBox(height: 50),
            Image.asset('assets/Checkmark.png'),
            SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.only(right: 125),
              child: Column(
                children: [
                  Text(
                    ' Welcome Back to DO IT ',
                    style: TextStyle(fontSize: 24, color: Colors.white),
                  ),
                  Text(
                    'Have an other productive day !',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ],
              ),
            ),
            SizedBox(height: 45),

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
                      if (emailController.text.contains('@gmail.com') ==
                          false) {
                        return 'Please enter a valid email';
                      }
                      return null;
                      // if( !RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$').hasMatch(value!)){
                      //   return 'Please enter a valid email';
                      // }
                    },
                  ),
                  SizedBox(height: 20),
                  Customtextformfield(
                    label: 'Password',
                    icon: Icons.lock,
                    controller: passwordController,
                    validator: (value) {
                      if (passwordController.text.isEmpty) {
                        return 'Please enter your password';
                      }
                      if (passwordController.text.length < 6) {
                        return 'Please enter a valid password';
                      }
                      return null;
                    },
                  ),
                ],
              ),
            ),

            SizedBox(height: 20),
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
            SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Appcolors.lightblue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                fixedSize: Size(350, 60),
              ),
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  //  Navigator.pushReplacement(
                  //   context,
                  //   MaterialPageRoute(builder: (context) => homescreen()),
                  // );
                }
              },
              child: Text(
                'Login',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,

              children: [
                Text(
                  'Don’t have an account?',
                  style: TextStyle(color: Colors.white),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Signupscreen()),
                    );
                  },
                  child: Text(
                    'Sign Up',
                    style: TextStyle(color: Appcolors.lightblue),
                  ),
                ),
              ],
            ),
            SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Sign in with :',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(width: 10),
                Customicons(
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.facebook, color: Colors.blue),
                  ),
                ),
                SizedBox(width: 10),
                Customicons(
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.apple, color: Colors.grey),
                  ),
                ),
                SizedBox(width: 10),
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
        ),
      ),
    );
  }
}
