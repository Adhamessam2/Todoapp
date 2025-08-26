import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoapp/core/style_manegares/colors.dart';
import 'package:todoapp/core/widegts/custom_button_nav_bar.dart';
import 'package:todoapp/features/addTasks/cubit/nav_cubit.dart';
import 'package:todoapp/features/addTasks/cubit/nav_state.dart';
import 'package:todoapp/features/addTasks/presentation/add_task_screen.dart';
import 'package:todoapp/features/calendar/calendar_Screen.dart';
import 'package:todoapp/features/calendar/cubit/calendar_cubit.dart';
import 'package:todoapp/features/home/presentation/screens/home_screen.dart';

class MainScreen extends StatelessWidget {
  MainScreen({super.key});

  final List<Widget> screens = [
    const HomeScreen(),
    const AddTaskScreen(),
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
          //body: screens[currentIndex],
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
          ),
          bottomNavigationBar: const CustomBottomNavBar(),
        );
      },
    );
  }
}
