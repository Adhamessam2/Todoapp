import 'package:flutter/material.dart';

class Customtextformfield extends StatelessWidget {
  final String label;
  final IconData? icon;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  const Customtextformfield({
    super.key,
    required this.label,
    required this.icon,
    this.validator,
    this.controller,
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
        validator: validator,
        controller: controller,
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
