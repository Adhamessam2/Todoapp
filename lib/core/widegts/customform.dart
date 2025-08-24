import 'package:flutter/material.dart';

class Customtextformfield extends StatelessWidget {
  final String label;
  final IconData? icon;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final bool ispassword;
  const Customtextformfield({
    super.key,
    required this.label,
    required this.icon,
    this.validator,
    this.controller,
    required this.ispassword,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: Container(
        margin: EdgeInsets.all(6),
        width: 390,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: TextFormField(
          validator: validator,
          controller: controller,
          obscureText: ispassword,
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
      ),
    );
  }
}
