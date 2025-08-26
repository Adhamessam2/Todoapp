import 'package:flutter/material.dart';

class SnackbarCustmized {
  const SnackbarCustmized({required this.message, required this.color});
  final String message;
  final Color color;

  void showSnackBar(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      duration: Duration(seconds: 1),
      backgroundColor: color,
      content: Center(
        heightFactor: 1,
        child: Text(
          message,
          style: TextStyle(color: Colors.white),
        ),
      ),
    ));
  }
}
