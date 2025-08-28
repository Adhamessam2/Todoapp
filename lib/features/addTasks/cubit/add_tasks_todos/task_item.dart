import 'package:flutter/material.dart';
import 'package:todoapp/core/models/todo_model.dart';
import 'package:todoapp/core/style_manegares/colors.dart';

class TaskItem extends StatelessWidget {
  final TodoModel task;
  final VoidCallback onDelete;
  final Function(TodoModel) onToggleComplete;
  final VoidCallback onTap;

  const TaskItem({
    super.key,
    required this.task,
    required this.onDelete,
    required this.onToggleComplete,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(task.id),
      direction: DismissDirection.startToEnd,
      background: Container(
        margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(16),
        ),
        alignment: Alignment.centerLeft,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: const Icon(Icons.delete, color: Colors.white),
      ),
      onDismissed: (_) => onDelete(),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
        decoration: BoxDecoration(
          color: task.isCompleted
              ? Colors.green.withOpacity(0.15)
              : Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: ListTile(
          leading: Transform.scale(
            scale: 1.3,
            child: Checkbox(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50),
              ),
              activeColor: Appcolors.blue,
              value: task.isCompleted,
              onChanged: (bool? value) {
                if (value != null) {
                  onToggleComplete(task.copyWith(isCompleted: value));
                }
              },
            ),
          ),
          title: AnimatedDefaultTextStyle(
            duration: const Duration(milliseconds: 300),
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: task.isCompleted ? Colors.grey : Colors.black,
              decoration: task.isCompleted ? TextDecoration.lineThrough : null,
            ),
            child: Text(task.title),
          ),
          subtitle: AnimatedOpacity(
            duration: const Duration(milliseconds: 300),
            opacity: task.isCompleted ? 0.6 : 1,
            child: Text(
              "${task.description}\nDeadline: ${task.deadline.day}/${task.deadline.month}/${task.deadline.year} "
              "${task.deadline.hour}:${task.deadline.minute.toString().padLeft(2, '0')}",
              style: const TextStyle(color: Colors.black87, fontSize: 13),
            ),
          ),
          trailing: IconButton(
            icon: const Icon(Icons.arrow_forward_ios, color: Appcolors.blue),
            onPressed: onTap,
          ),
        ),
      ),
    );
  }
}
