import 'package:flutter/material.dart';

class Customtextformfield extends StatelessWidget {
  final String label;
  final IconData? icon;
  const Customtextformfield({
    super.key,
    required this.label,
    required this.icon,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextFormField(
        decoration: InputDecoration(
          hintText: label,
          hintStyle: TextStyle(color: Colors.black),
          prefixIcon: Icon(icon, color: Colors.black),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}
