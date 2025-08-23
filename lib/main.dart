import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'package:todoapp/Auth/features/splash.dart';
=======
import 'package:todoapp/features/splash.dart';
>>>>>>> e139122b33bf5e49047ed4fbaaa599cc00873db6

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
