import 'package:flutter/material.dart';
import 'package:todoapp/core/style_manegares/colors.dart';
import 'package:todoapp/features/auth/login/login.dart';
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
              padding: const EdgeInsets.only(right: 90),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 85),
                    child: Text(
                      'Welcome to DO IT ',
                      style: TextStyle(fontSize: 24, color: Colors.white),
                    ),
                  ),
                  Text(
                    'create an account and Join us now!',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ],
              ),
            ),
            SizedBox(height: 45),
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
                  SizedBox(height: 20),
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
                  SizedBox(height: 20),
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
                if (formkey.currentState!.validate()) {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => Loginscreen()),
                  );
                }
              },
              child: Text(
                'Sign Up',
                style: TextStyle(color: Colors.white, fontSize: 20),
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
                      MaterialPageRoute(builder: (context) => Loginscreen()),
                    );
                  },
                  child: Text(
                    'Sign In',
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
                  'Sign Up with :',
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
