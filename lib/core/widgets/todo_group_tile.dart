import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:todoapp/core/style_manegares/colors.dart';

class TodoGroupTile extends StatelessWidget {
  const TodoGroupTile({
    super.key,
    required this.isDone,
    required this.onTap,
    required this.task,
    required this.onSlid,
    required this.todoOwner,
  });
  final bool isDone;
  final String task;
  final String todoOwner;
  final VoidCallback onTap;
  final SlidableActionCallback onSlid;
  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.sizeOf(context).width;
    return Padding(
      padding: EdgeInsets.all(width * 0.02),
      child: Slidable(
        endActionPane: ActionPane(
          motion: StretchMotion(),
          children: [
            SlidableAction(
              onPressed: onSlid,
              icon: Icons.delete,
              backgroundColor: Colors.black,
            ),
          ],
        ),
        child: Container(
          padding: EdgeInsets.all(width * 0.03),
          decoration: BoxDecoration(
            color: Appcolors.gunmetal,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
              Checkbox(
                value: isDone,
                onChanged: (bool? newValue) {
                  onTap();
                },
                checkColor: Appcolors.secColor,
                activeColor: Appcolors.primaryColor,
              ),
              SizedBox(
                width: width * 0.7,
                child: Text(
                  task,
                  style: TextStyle(
                    decoration: isDone
                        ? TextDecoration.lineThrough
                        : TextDecoration.none,
                    decorationColor: Appcolors.gunmetal,
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
      ),
    );
  }
}
