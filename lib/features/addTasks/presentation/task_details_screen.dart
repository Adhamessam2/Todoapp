import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoapp/core/models/todo_model.dart';
import 'package:todoapp/core/models/todo_item_model.dart';
import 'package:todoapp/core/style_manegares/colors.dart';
import 'package:todoapp/features/addTasks/cubit/add_tasks_todos/todo_logic.dart';
import 'package:todoapp/features/addTasks/cubit/add_tasks_todos/todo_states.dart';

class TaskDetailsScreen extends StatefulWidget {
  final TodoModel task;

  const TaskDetailsScreen({super.key, required this.task});

  @override
  State<TaskDetailsScreen> createState() => _TaskDetailsScreenState();
}

class _TaskDetailsScreenState extends State<TaskDetailsScreen> {
  final TextEditingController _todoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Appcolors.navyblue,
      appBar: AppBar(
        title: Text(
          widget.task.title,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Appcolors.navyblue,
        foregroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            //  Todos list
            Expanded(
              child: BlocBuilder<TodoCubit, TodoState>(
                builder: (context, state) {
                  if (state is TodoLoaded) {
                    TodoModel? task = state.tasks.firstWhere(
                      (t) => t.id == widget.task.id,
                      orElse: () => widget.task,
                    );

                    if (task.todos.isEmpty) {
                      return const Center(
                        child: Text(
                          "No todos yet",
                          style: TextStyle(
                            color: Colors.white70,
                            fontWeight: FontWeight.w700,
                            fontSize: 20,
                          ),
                        ),
                      );
                    }

                    return ListView.builder(
                      itemCount: task.todos.length,
                      itemBuilder: (context, index) {
                        final todo = task!.todos[index];
                        return GestureDetector(
                          onTap: () {
                            context.read<TodoCubit>().toggleTodoCompletion(
                              task.id,
                              todo.id,
                            );
                          },
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                            margin: const EdgeInsets.symmetric(vertical: 6),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 10,
                            ),
                            decoration: BoxDecoration(
                              color: todo.isCompleted
                                  ? Colors.green.withOpacity(0.1)
                                  : Colors.white.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(14),
                              border: Border.all(
                                color: todo.isCompleted
                                    ? Colors.green
                                    : Colors.white24,
                              ),
                            ),
                            child: Row(
                              children: [
                                AnimatedSwitcher(
                                  duration: const Duration(milliseconds: 300),
                                  transitionBuilder: (child, anim) =>
                                      ScaleTransition(
                                        scale: anim,
                                        child: child,
                                      ),
                                  child: Icon(
                                    todo.isCompleted
                                        ? Icons.check_circle
                                        : Icons.radio_button_unchecked,
                                    key: ValueKey(todo.isCompleted),
                                    color: todo.isCompleted
                                        ? Colors.green
                                        : Colors.grey,
                                    size: 26,
                                  ),
                                ),
                                const SizedBox(width: 12),
                                Expanded(
                                  child: AnimatedDefaultTextStyle(
                                    duration: const Duration(milliseconds: 300),
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      color: todo.isCompleted
                                          ? Colors.green
                                          : Colors.white,
                                      decoration: todo.isCompleted
                                          ? TextDecoration.lineThrough
                                          : null,
                                    ),
                                    child: Text(todo.title),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  }
                  return const Center(
                    child: CircularProgressIndicator(color: Colors.white),
                  );
                },
              ),
            ),

            const SizedBox(height: 12),

            //  Add new todo
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _todoController,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white.withOpacity(0.1),
                      hintText: "Add todo...",
                      hintStyle: const TextStyle(color: Colors.white54),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(14),
                        borderSide: BorderSide.none,
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 14,
                        vertical: 12,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Container(
                  decoration: BoxDecoration(
                    color: Appcolors.blue,
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: IconButton(
                    icon: const Icon(Icons.add, color: Colors.white, size: 28),
                    onPressed: () {
                      if (_todoController.text.isNotEmpty) {
                        final newTodo = TodoItem(
                          id: DateTime.now().toString(),
                          title: _todoController.text,
                          isCompleted: false,
                        );
                        context.read<TodoCubit>().addTodoToTask(
                          widget.task.id,
                          newTodo,
                        );
                        _todoController.clear();
                      }
                    },
                  ),
                ),
              ],
            ),

            const SizedBox(height: 16),

            BlocBuilder<TodoCubit, TodoState>(
              builder: (context, state) {
                if (state is TodoLoaded) {
                  TodoModel? task = state.tasks.firstWhere(
                    (t) => t.id == widget.task.id,
                    orElse: () => widget.task,
                  );

                  if (task.todos.isEmpty) return const SizedBox();

                  final completedCount = task.todos
                      .where((t) => t.isCompleted)
                      .length;
                  final allCompleted = completedCount == task.todos.length;

                  return AnimatedContainer(
                    duration: const Duration(milliseconds: 400),
                    curve: Curves.easeInOut,
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      color: allCompleted
                          ? Colors.green.withOpacity(0.15)
                          : Colors.blue.withOpacity(0.15),
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          allCompleted
                              ? Icons.check_circle
                              : Icons.info_outline,
                          color: allCompleted ? Colors.green : Colors.blue,
                        ),
                        const SizedBox(width: 10),
                        Text(
                          allCompleted
                              ? "All Tasks completed 🎉"
                              : "$completedCount / ${task.todos.length} todos completed",
                          style: TextStyle(
                            color: allCompleted ? Colors.green : Colors.blue,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  );
                }
                return const SizedBox();
              },
            ),
          ],
        ),
      ),
    );
  }
}
