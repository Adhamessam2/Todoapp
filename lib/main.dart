import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoapp/features/addTasks/cubit/Add%20tasks&todos/todoLogic.dart';
import 'package:todoapp/features/auth/cubit/logic.dart';
import 'package:todoapp/features/calendar/cubit/calendar_cubit.dart';
import 'package:todoapp/features/splash_screen/splash.dart';
import 'package:todoapp/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(Todoapp());
}

class Todoapp extends StatelessWidget {
  const Todoapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => TodoCubit()),
        BlocProvider(create: (context) => CalendarCubit()),
        BlocProvider(create: (context) => Authlogic()),
      ],
      child: MaterialApp(
        home: const Splashscreen(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
