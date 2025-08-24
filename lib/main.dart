import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoapp/features/addTasks/cubit/Add%20tasks&todos/todoLogic.dart';
import 'package:todoapp/features/splash_screen/splash.dart';
import 'package:todoapp/firebase_options.dart';

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
    return BlocProvider(
      create: (context) => TodoCubit(),
      child: MaterialApp(
        home: const Splashscreen(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
