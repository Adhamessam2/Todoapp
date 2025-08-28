import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:todoapp/core/widegts/authgate.dart';
import 'package:todoapp/features/addTasks/cubit/add_tasks_todos/todo_logic.dart';
import 'package:todoapp/features/addTasks/cubit/nav_cubit.dart';
import 'package:todoapp/features/auth/cubit/logic.dart';
import 'package:todoapp/features/calendar/cubit/calendar_cubit.dart';
import 'package:todoapp/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const Todoapp());
}

class Todoapp extends StatelessWidget {
  const Todoapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => Authlogic()),
        BlocProvider(create: (_) => TodoCubit()),
        BlocProvider(create: (_) => CalendarCubit()),
        BlocProvider(create: (_) => NavCubit()),
      ],
      child: ScreenUtilInit(
        designSize: const Size(411, 731),
        minTextAdapt: true,
        builder: (context, child) {
          return MaterialApp(
            home: Authgate(),
            debugShowCheckedModeBanner: false,
          );
        },
      ),
    );
  }
}
