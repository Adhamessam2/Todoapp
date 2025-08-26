import 'package:flutter/material.dart';

class CustmizedTodoField extends StatelessWidget {
  const CustmizedTodoField({super.key, required this.ctrl});

  final TextEditingController ctrl;

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: TextStyle(color: Colors.black),
      controller: ctrl,
      decoration: InputDecoration(
        fillColor: Colors.brown,
        labelText: "Type your task here",
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: const Color.fromARGB(255, 255, 255, 255),
            width: 2,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}
