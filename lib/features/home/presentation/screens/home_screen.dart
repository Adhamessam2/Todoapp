import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoapp/core/widegts/custom_button_nav_bar.dart';
import 'package:todoapp/features/addTasks/cubit/Add%20tasks&todos/todo_cubit.dart';
import 'package:todoapp/features/addTasks/cubit/nav_cubit.dart';
import 'package:todoapp/features/addTasks/cubit/nav_state.dart';
import 'package:todoapp/features/addTasks/presentation/addtask_screen.dart';
import 'package:todoapp/features/calendar/calendar_Screen.dart';
import 'package:todoapp/features/calendar/cubit/calendar_cubit.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final List<Widget> screens = [
    // HomeScreen(),
    // AddtaskScreen(),
    BlocProvider(create: (context) => TodoCubit(), child: AddtaskScreen()),

    BlocProvider(create: (context) => CalendarCubit(), child: CalendarScreen()),
    // SettingsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavCubit, NavState>(
      builder: (context, state) {
        int currentIndex = 1;

        if (state is NavInitial) currentIndex = state.index;
        if (state is NavChanged) currentIndex = state.index;

        return Scaffold(
          body: screens[currentIndex],
          bottomNavigationBar: const CustomBottomNavBar(),
        );
      },
    );
  }
}
