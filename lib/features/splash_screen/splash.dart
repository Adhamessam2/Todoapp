import 'package:flutter/material.dart';
<<<<<<<< HEAD:lib/Auth/features/splash.dart
import 'package:todoapp/core/colors.dart';
import 'package:todoapp/Auth/features/onboarding/startscreen1.dart';
========
import 'package:todoapp/core/style_manegares/colors.dart';
import 'package:todoapp/features/auth/onboarding_screen/startscreen1.dart';
>>>>>>>> 955978f2ac158795e90fde44dbb385c8143f1701:lib/features/splash_screen/splash.dart

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Startscreen1()),
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,

        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Appcolors.blue, Appcolors.navyblue],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),

        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 160),
              child: Image.asset('assets/Checkmark.png'),
            ),
            SizedBox(height: 30),
            Image.asset('assets/DO IT.png'),
            SizedBox(height: 400),
            Text(
              'v 1.0.0',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
