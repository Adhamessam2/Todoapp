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
            color: Colors.white,
            spreadRadius: 0,
            blurRadius: 2,
            offset: Offset(0, 0),
          ),
        ],
      ),
      child: child,
    );
  }
}
