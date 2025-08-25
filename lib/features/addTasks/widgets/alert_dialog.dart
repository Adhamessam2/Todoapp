import 'package:flutter/material.dart';
import 'package:todoapp/features/addTasks/widgets/button.dart';
import 'package:todoapp/features/addTasks/widgets/custmized_todo_field.dart';

class AlertDialogc extends StatelessWidget {
  AlertDialogc({
    super.key,
    required this.titleCtrl,
    required this.desCtrl,
    this.addFun,
    required this.deadline,
  });
  final TextEditingController titleCtrl;
  DateTime deadline;
  final TextEditingController desCtrl;
  final addFun;
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return AlertDialog(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      content: SizedBox(
        height: height,
        child: Column(
          children: [
            CustmizedTodoField(ctrl: titleCtrl),
            SizedBox(height: 5),
            CustmizedTodoField(ctrl: desCtrl),
            SizedBox(height: 15),
            SizedBox(
              height: 300,
              width: 300,
              child: CalendarDatePicker(
                initialDate: DateTime.now(),
                firstDate: DateTime(2010),
                lastDate: DateTime(2030),
                onDateChanged: (value) {
                  deadline = value;
                  print(deadline);
                },
              ),
            ),
            Button(addFun: addFun),
          ],
        ),
      ),
      title: Text("Add Task"),
    );
  }
}
