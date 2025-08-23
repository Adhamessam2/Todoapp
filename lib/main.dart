import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'package:todoapp/Auth/features/splash.dart';
=======
import 'package:todoapp/features/splash_screen/splash.dart';
>>>>>>> 955978f2ac158795e90fde44dbb385c8143f1701

void main() {
  runApp(Todoapp());
}

class Todoapp extends StatefulWidget {
  const Todoapp({super.key});

  @override
  State<Todoapp> createState() => _TodoappState();
}

class _TodoappState extends State<Todoapp> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Splashscreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
