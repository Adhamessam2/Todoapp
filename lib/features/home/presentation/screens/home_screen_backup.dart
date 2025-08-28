import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoapp/core/style_manegares/colors.dart';
import 'package:todoapp/core/widegts/authgate.dart';
import 'package:todoapp/features/addTasks/cubit/add_tasks_todos/todo_logic.dart';
import 'package:todoapp/features/addTasks/cubit/add_tasks_todos/todo_states.dart';
import 'package:todoapp/features/auth/cubit/logic.dart';
import 'package:todoapp/features/auth/cubit/states.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: BlocConsumer<Authlogic, AuthStates>(
        listener: (context, state) {
          if (state is AuthLogout) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const Authgate()),
            );
          }
        },
        builder: (context, state) {
          final cubit = context.read<Authlogic>();
          if (state is AuthSuccessState) {
            final userinfo = state.authModel;
            return Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    // Appcolors.navyblue,
                    Appcolors.blue,
                    Appcolors.lightblue,
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: SafeArea(
                child: Column(
                  children: [
                    // ====== Header ======
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 10,
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
                          child: Container(
                            padding: const EdgeInsets.all(15),
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.15),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Row(
                              children: [
                                CircleAvatar(
                                  radius: 25,
                                  backgroundColor: Colors.white,
                                  child: Icon(
                                    Icons.person,
                                    color: Appcolors.textcolor,

                                    size: 28,
                                  ),
                                ),
                                const SizedBox(width: 15),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Hello ${userinfo.profile.username}",

                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      userinfo.profile.email,
                                      style: const TextStyle(
                                        color: Colors.white70,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 50),

                    //  Tasks Section
                    Expanded(
                      child: BlocBuilder<TodoCubit, TodoState>(
                        builder: (context, todoState) {
                          if (todoState is TodoLoaded) {
                            final completedTasks = todoState.tasks
                                .where((task) => task.isCompleted)
                                .toList();
                            final incompleteTasks = todoState.tasks
                                .where((task) => !task.isCompleted)
                                .toList();

                            if (todoState.tasks.isEmpty) {
                              return Center(
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 30,
                                    vertical: 20,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.white.withOpacity(0.15),
                                    borderRadius: BorderRadius.circular(20),
                                    border: Border.all(color: Colors.white24),
                                  ),
                                  child: const Text(
                                    "No tasks yet",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              );
                            }

                            return Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 20,
                              ),
                              child: ListView(
                                children: [
                                  if (incompleteTasks.isNotEmpty) ...[
                                    _buildSectionTitle("Incomplete Tasks"),
                                    ...incompleteTasks.map(
                                      (task) => _buildTaskCard(
                                        task.title,
                                        task.description,
                                        false,
                                      ),
                                    ),
                                    const SizedBox(height: 25),
                                  ],
                                  if (completedTasks.isNotEmpty) ...[
                                    _buildSectionTitle("Completed Tasks"),
                                    ...completedTasks.map(
                                      (task) => _buildTaskCard(
                                        task.title,
                                        task.description,
                                        true,
                                      ),
                                    ),
                                  ],
                                ],
                              ),
                            );
                          } else if (todoState is TodoLoading) {
                            return const Center(
                              child: CircularProgressIndicator(
                                color: Colors.white,
                              ),
                            );
                          } else {
                            return Center(
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 30,
                                  vertical: 20,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.15),
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(color: Colors.white24),
                                ),
                                child: const Text(
                                  "No tasks yet",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            );
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
            );
          } else {
            return Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Appcolors.navyblue,
                    Appcolors.blue,
                    Appcolors.lightblue,
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                  ),
                  onPressed: () {
                    cubit.logout();
                  },
                  child: const Text(
                    "logout",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ),
            );
          }
        },
      ),
    );
  }

  // ===== Widgets =====
  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        color: Colors.white,
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _buildTaskCard(String title, String description, bool completed) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.15),
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.white24),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w600,
              decoration: completed ? TextDecoration.lineThrough : null,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            description,
            style: TextStyle(
              color: Colors.white70,
              fontSize: 13,
              decoration: completed ? TextDecoration.lineThrough : null,
            ),
          ),
        ],
      ),
    );
  }
}
