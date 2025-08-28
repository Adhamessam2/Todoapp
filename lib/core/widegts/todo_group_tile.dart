import 'package:flutter/material.dart';
import 'package:todoapp/core/style_manegares/colors.dart';

class TodoGroupTile extends StatelessWidget {
  const TodoGroupTile({
    super.key,
    required this.isDone,
    required this.onTap,
    required this.task,
    required this.todoOwner,
  });
  final bool isDone;
  final String task;
  final String todoOwner;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.sizeOf(context).width;
    return Padding(
      padding: EdgeInsets.all(width * 0.02),
      child: Container(
        padding: EdgeInsets.all(width * 0.03),
        decoration: BoxDecoration(
          color: Appcolors.lightblue,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Checkbox(
              value: isDone,
              onChanged: (bool? newValue) {
                onTap();
              },
              checkColor: Appcolors.navyblue,
              activeColor: Appcolors.blue,
            ),
            SizedBox(
              width: width * 0.7,
              child: Text(
                task,
                style: TextStyle(
                  decoration: isDone
                      ? TextDecoration.lineThrough
                      : TextDecoration.none,
                  decorationColor: Appcolors.lightblue,
                  decorationStyle: TextDecorationStyle.solid,
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
