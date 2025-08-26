import 'package:flutter/material.dart';

class Forwardbutton extends StatelessWidget {
  final Function()? onPressed;
  const Forwardbutton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      height: 60,
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Colors.white,
            spreadRadius: 1,
            blurRadius: 2,
            offset: Offset(1, 1),
          ),
        ],
      ),
      child: IconButton(
        icon: Icon(Icons.arrow_forward),
        color: Colors.black,
        iconSize: 30,
        onPressed: () {
          onPressed!();
        },
      ),
    );
  }
}
