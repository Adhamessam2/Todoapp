import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  const Button({super.key, required this.addFun});
  final Function addFun;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        addFun();

        print('---------------------');
      },
      child: Container(
        height: 50,
        width: 150,
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(
          child: Text(
            "Add",
            style: TextStyle(color: Colors.white, fontSize: 24),
          ),
        ),
      ),
    );
  }
}
