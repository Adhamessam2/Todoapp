import 'package:flutter/material.dart';
import 'package:todoapp/core/models/todo_model.dart';
import 'package:todoapp/features/addTasks/cubit/Add%20tasks&todos/todo_cubit.dart';

class TodoTile extends StatelessWidget {
  const TodoTile({super.key, required this.task, required this.toggol});

  final TodoModel task;
  final VoidCallback toggol;
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8),
      child: ListTile(
        leading: Transform.scale(
          scale: 1.3,
          child: Checkbox(
            value: task.isCompleted,
            onChanged: (value) {
              toggol;
            },
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
            ),
            side: MaterialStateBorderSide.resolveWith(
              (states) => BorderSide(
                width: 2,
                color: task.isCompleted ? Colors.green : Colors.grey.shade400,
              ),
            ),
            checkColor: Colors.white,
            activeColor: Colors.green,
            fillColor: MaterialStateProperty.resolveWith((states) {
              if (states.contains(MaterialState.selected)) {
                return Colors.green;
              }
              return Colors.transparent;
            }),
          ),
        ),
        title: Text(
          task.title,
          style: TextStyle(
            decoration: task.isCompleted
                ? TextDecoration.lineThrough
                : TextDecoration.none,
            color: task.isCompleted ? Colors.grey : Colors.black,
          ),
        ),
        subtitle: Text(
          "${task.description}\nDeadline: ${task.deadline.day}/${task.deadline.month}/${task.deadline.year} ${task.deadline.hour}:${task.deadline.minute.toString().padLeft(2, '0')}",
          style: TextStyle(
            decoration: task.isCompleted
                ? TextDecoration.lineThrough
                : TextDecoration.none,
            color: task.isCompleted ? Colors.grey : Colors.black54,
          ),
        ),
      ),
    );
  }
}
