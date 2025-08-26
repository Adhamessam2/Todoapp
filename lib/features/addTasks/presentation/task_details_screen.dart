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
        title: Text(widget.task.title),
        backgroundColor: Appcolors.navyblue,
        foregroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            

            Expanded(
              child: BlocBuilder<TodoCubit, TodoState>(
                builder: (context, state) {
                  if (state is TodoLoaded) {
                    TodoModel? task;
                    for (var t in state.tasks) {
                      if (t.id == widget.task.id) {
                        task = t;
                        break;
                      }
                    }
                    task ??= widget.task;

                    if (task.todos.isEmpty) {
                      return const Center(child: Text("No todos yet",
                      style: TextStyle(color: Colors.white,
                      fontWeight: FontWeight.w900,
                      fontSize: 30),
                      ));
                    }

                    return ListView(
                      children: task.todos.map((todo) {
                        return ListTile(
                          leading: Icon(
                            todo.isCompleted
                                ? Icons.check_circle
                                : Icons.radio_button_unchecked,
                            color: todo.isCompleted ? Colors.green : Colors.grey,
                          ),
                          title: Text(
                            todo.title,
                            style: TextStyle(
                              decoration: todo.isCompleted
                                  ? TextDecoration.lineThrough
                                  : TextDecoration.none,
                              color:
                                  todo.isCompleted ? Colors.green : const Color.fromARGB(255, 255, 255, 255),
                            ),
                          ),
                          onTap: () {
                            context
                                .read<TodoCubit>()
                                .toggleTodoCompletion(task!.id, todo.id);
                          },
                        );
                      }).toList(),
                    );
                  }
                  return const Center(child: CircularProgressIndicator());
                },
              ),
            ),

            const SizedBox(height: 16),

            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _todoController,style: TextStyle(color: Colors.white,
                      fontWeight: FontWeight.w900,
                      ),
                    decoration: InputDecoration(
                      
                      hintText: "Add todo",
                      hintStyle: const TextStyle(color: Colors.white),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                IconButton(
                  icon: const Icon(
                    Icons.add,
                    color: Color.fromARGB(255, 241, 249, 255),
                    size: 30,
                  ),
                  onPressed: () {
                    if (_todoController.text.isNotEmpty) {
                      final newTodo = TodoItem(
                        id: DateTime.now().toString(),
                        title: _todoController.text,
                        isCompleted: false,
                      );
                      context
                          .read<TodoCubit>()
                          .addTodoToTask(widget.task.id, newTodo);
                      _todoController.clear();
                    }
                  },
                ),
              ],
            ),

            const SizedBox(height: 16),

            BlocBuilder<TodoCubit, TodoState>(
              builder: (context, state) {
                if (state is TodoLoaded) {
                  TodoModel? task;
                  for (var t in state.tasks) {
                    if (t.id == widget.task.id) {
                      task = t;
                      break;
                    }
                  }
                  task ??= widget.task;

                  if (task.todos.isEmpty) return const SizedBox();

                  final completedCount =
                      task.todos.where((t) => t.isCompleted).length;
                  final allCompleted = completedCount == task.todos.length;

                  return Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: allCompleted
                          ? Colors.green.withOpacity(0.1)
                          : Colors.blue.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          allCompleted ? Icons.check_circle : Icons.info,
                          color: allCompleted ? Colors.green : Colors.blue,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          allCompleted
                              ? "Task completed"
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
