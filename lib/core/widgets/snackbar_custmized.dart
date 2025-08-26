import 'package:flutter/material.dart';

class SnackbarCustmized {
  const SnackbarCustmized({
    required this.time,
    required this.message,
    required this.color,
  });
  final String message;
  final Color color;
  final int time;
  void showSnackBar(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: Duration(seconds: time),
        backgroundColor: color,
        content: Center(
          heightFactor: 1,
          child: Text(message, style: TextStyle(color: Colors.white)),
        ),
      ),
    );
  }
}
