import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class TodoTile extends StatelessWidget {
  const TodoTile({
    super.key,
    required this.isDone,
    required this.onTap,
    required this.task,
    required this.onSlid,
  });
  final bool isDone;
  final String task;
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
              backgroundColor: Colors.red,
            ),
          ],
        ),
        child: Container(
          padding: EdgeInsets.all(width * 0.03),
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
              Checkbox(
                value: isDone,
                onChanged: (bool? newValue) {
                  onTap();
                },
                checkColor: Colors.black,
                activeColor: Colors.white,
              ),
              SizedBox(
                width: width * 0.7,
                child: Text(
                  task,
                  style: TextStyle(
                    decoration: isDone
                        ? TextDecoration.lineThrough
                        : TextDecoration.none,
                    decorationColor: Colors.red,
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
