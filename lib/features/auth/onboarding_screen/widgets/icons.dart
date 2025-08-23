import 'package:flutter/material.dart';

class Customicons extends StatelessWidget {
  final Widget child;

  const Customicons({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: const Color.fromARGB(255, 71, 70, 70),
            spreadRadius: 1,
            blurRadius: 1,
            offset: Offset(0, 0),
          ),
        ],
      ),
      child: child,
    );
  }
}
