import 'package:flutter/material.dart';
import 'package:todoapp/core/models/todo_model.dart';
import 'package:todoapp/core/style_manegares/colors.dart';

class TodoTile extends StatelessWidget {
  const TodoTile({super.key, required this.todo, required this.onTap});
  final TodoModel todo;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.sizeOf(context).width;
    return Padding(
      padding: EdgeInsets.all(width * 0.02),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          width: width * 0.9,
          padding: EdgeInsets.all(width * 0.03),
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: const Color.fromARGB(255, 2, 17, 30),
                spreadRadius: 2,
                blurRadius: BorderSide.strokeAlignOutside,
                blurStyle: BlurStyle.normal,
                offset: Offset(5, 6), // X, Y position
              ),
            ],
            color: Appcolors.lightblue,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                todo.title,
                style: TextStyle(
                  decoration: todo.isCompleted
                      ? TextDecoration.lineThrough
                      : TextDecoration.none,
                  color: Appcolors.blue,
                  fontWeight: FontWeight.w600,
                  fontSize: 24,
                ),
                textAlign: TextAlign.center,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'deadline : ${todo.deadline.toString().split(" ")[0]}',
                    style: TextStyle(
                      decoration: todo.isCompleted
                          ? TextDecoration.lineThrough
                          : TextDecoration.none,
                      color: Appcolors.navyblue,
                      fontWeight: FontWeight.w600,
                      fontSize: 12,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Row(
                    children: [
                      Text(
                        (todo.isCompleted ? "Done" : "Not Yet"),
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 12,
                        ),
                      ),
                      Icon(
                        (todo.isCompleted)
                            ? Icons.check_circle
                            : Icons.pending_actions,
                        color: (todo.isCompleted)
                            ? Colors.green
                            : Appcolors.navyblue,
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
