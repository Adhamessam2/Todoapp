import 'package:flutter/material.dart';

class Dash extends StatelessWidget {
  final double width;
  const Dash({super.key, required this.width});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 10,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        // pill shape
      ),
    );
  }
}
