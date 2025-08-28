import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoapp/core/widegts/authgate.dart';
import 'package:todoapp/features/addTasks/cubit/add_tasks_todos/todo_logic.dart';
import 'package:todoapp/features/addTasks/cubit/nav_cubit.dart';
import 'package:todoapp/features/auth/cubit/logic.dart';
import 'package:todoapp/features/calendar/cubit/calendar_cubit.dart';
import 'package:todoapp/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
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
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => TodoCubit()),
        BlocProvider(create: (context) => CalendarCubit()),
        BlocProvider(create: (context) => Authlogic()),
        BlocProvider(create: (context) => NavCubit()),
      ],
      child: MaterialApp(home: Authgate(), debugShowCheckedModeBanner: false),
    );
  }
}
