import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoapp/core/style_manegares/colors.dart';
import 'package:todoapp/features/addTasks/cubit/add_tasks_todos/add_task_dialog.dart';
import 'package:todoapp/features/addTasks/cubit/add_tasks_todos/search_filter_bar.dart';
import 'package:todoapp/features/addTasks/cubit/add_tasks_todos/task_item.dart';
import 'package:todoapp/features/addTasks/cubit/add_tasks_todos/todo_logic.dart';
import 'package:todoapp/features/addTasks/cubit/add_tasks_todos/todo_states.dart';
import 'package:todoapp/features/addTasks/presentation/task_details_screen.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({super.key});

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  String sortBy = "Date";

  void _openAddTaskDialog() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => AddTaskDialog(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Appcolors.blue,
      appBar: AppBar(
        backgroundColor: Appcolors.blue,
        title: const Text(
          "My Tasks",
          style: TextStyle(
            color: Colors.white,
            fontSize: 22,
            fontWeight: FontWeight.w900,
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Appcolors.blue, Appcolors.lightblue],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: BlocBuilder<TodoCubit, TodoState>(
          builder: (context, state) {
            if (state is TodoLoaded) {
              return Column(
                children: [
                  // 🔍 Search + Filter
                  SearchFilterBar(
                    sortBy: sortBy,
                    onSortChanged: (value) => setState(() => sortBy = value),
                  ),

                  // 📋 Task List
                  Expanded(
                    child: state.tasks.isEmpty
                        ? const Center(
                            child: Text(
                              "No tasks yet",
                              style: TextStyle(
                                color: Colors.white70,
                                fontSize: 18,
                              ),
                            ),
                          )
                        : ListView.builder(
                            padding: const EdgeInsets.only(top: 8),
                            itemCount: state.tasks.length,
                            itemBuilder: (context, index) {
                              final task = state.tasks[index];
                              return TaskItem(
                                task: task,
                                onDelete: () => context
                                    .read<TodoCubit>()
                                    .deleteTask(task.id),
                                onToggleComplete: (updatedTask) => context
                                    .read<TodoCubit>()
                                    .updateTask(updatedTask),
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          TaskDetailsScreen(task: task),
                                    ),
                                  );
                                },
                              );
                            },
                          ),
                  ),
                ],
              );
            }
            return const Center(
              child: CircularProgressIndicator(color: Colors.white),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _openAddTaskDialog,
        backgroundColor: Appcolors.blue,
        elevation: 10,
        shape: const CircleBorder(),
        child: const Icon(Icons.add, color: Colors.white, size: 30),
      ),
    );
  }
}
