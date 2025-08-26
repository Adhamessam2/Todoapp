import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoapp/core/models/user_model.dart';
import 'package:todoapp/features/home/widgets/custom_button_nav_bar.dart';
import 'package:todoapp/features/addTasks/cubit/Add%20tasks&todos/todo_cubit.dart';
import 'package:todoapp/features/home/cubit/nav/nav_cubit.dart';
import 'package:todoapp/features/home/cubit/nav/nav_state.dart';
import 'package:todoapp/features/addTasks/presentation/addtask_screen.dart';
// import 'package:todoapp/features/calendar/calendar_Screen.dart';
// import 'package:todoapp/features/calendar/cubit/calendar_cubit.dart';
import 'package:todoapp/features/home/cubit/home/home_cubit.dart';
import 'package:todoapp/features/home/presentation/screens/home_screen.dart';
import 'package:todoapp/features/settings/cubit/settings_cubit.dart';
import 'package:todoapp/features/settings/settings_screen.dart';
import 'package:todoapp/features/todo_details/todo_details_screen.dart';

class NavigationScreen extends StatelessWidget {
  NavigationScreen({super.key, required this.user});
  final UserModel user;
  final List<Widget> screens = [
    TodoDetailsScreen(),

    BlocProvider(create: (context) => SettingsCubit(), child: SettingsScreen()),

    BlocProvider(
      create: (context) => HomeCubit()..loadTodos(),
      child: HomeScreen(),
    ),
    BlocProvider(create: (context) => TodoCubit(), child: AddtaskScreen()),
    // BlocProvider(create: (context) => CalendarCubit(), child: CalendarScreen()),
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
