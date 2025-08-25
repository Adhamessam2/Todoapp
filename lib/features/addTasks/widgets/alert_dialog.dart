import 'package:flutter/material.dart';
import 'package:todoapp/features/addTasks/widgets/button.dart';

class AlertDialogc extends StatelessWidget {
  const AlertDialogc({super.key, required this.ctrl, this.addFun});
  final TextEditingController ctrl;
  final addFun;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.red,
      content: SizedBox(
        height: 200,
        child: Column(
          children: [
            TextField(
              style: TextStyle(color: Colors.black),
              controller: ctrl,
              decoration: InputDecoration(
                fillColor: Colors.brown,
                labelText: "Type your taske here",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: const Color.fromARGB(255, 255, 255, 255),
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            SizedBox(height: 15),
            Button(addFun: addFun),
          ],
        ),
      ),
      title: Text("Add Taske"),
    );
  }
}
