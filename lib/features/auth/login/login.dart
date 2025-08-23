import 'package:flutter/material.dart';
<<<<<<<< HEAD:lib/Auth/features/login.dart
import 'package:todoapp/core/colors.dart';
import 'package:todoapp/Auth/features/signup.dart';
import 'package:todoapp/Auth/features/widgets/customform.dart';
import 'package:todoapp/Auth/features/widgets/icons.dart';
========
import 'package:todoapp/core/style_manegares/colors.dart';
import 'package:todoapp/features/auth/signup/signup.dart';

import '../../../core/widegts/customform.dart';
import '../onboarding_screen/widgets/icons.dart';
>>>>>>>> 955978f2ac158795e90fde44dbb385c8143f1701:lib/features/auth/login/login.dart

class Loginscreen extends StatefulWidget {
  const Loginscreen({super.key});

  @override
  State<Loginscreen> createState() => _LoginscreenState();
}

class _LoginscreenState extends State<Loginscreen> {
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

            Customtextformfield(label: 'Email', icon: Icons.email),
            SizedBox(height: 20),
            Customtextformfield(label: 'Password', icon: Icons.lock),
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
              onPressed: () {},
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
