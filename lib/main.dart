import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
<<<<<<< HEAD
import 'package:todoapp/features/auth/cubit/logic.dart';
import 'package:todoapp/features/auth/login/login.dart';
=======
import 'package:todoapp/features/addTasks/cubit/nav_cubit.dart';
import 'package:todoapp/features/addTasks/presentation/main_screen.dart';
>>>>>>> f0e7fdd49181485db3352498167cc5737a0dc319
import 'package:todoapp/features/calendar/calendar_Screen.dart';
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
<<<<<<< HEAD
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => CalendarCubit()),
        BlocProvider(create: (context) => Authlogic()),
      ],
      child: MaterialApp(
        home: Splashscreen(),
        debugShowCheckedModeBanner: false,
      ),
=======
    return MaterialApp(
      home: BlocProvider(create: (context) => NavCubit(), child: MainScreen()),
      debugShowCheckedModeBanner: false,
>>>>>>> f0e7fdd49181485db3352498167cc5737a0dc319
    );
  }
}
