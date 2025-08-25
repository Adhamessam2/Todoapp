import 'package:flutter/material.dart';

class CustomTextfaield extends StatefulWidget {
  final String label;
  final Icon icon;
  final String? Function(String?) validate;
  final TextEditingController controller;
  final bool obscure;

  const CustomTextfaield({
    super.key,
    required this.label,
    required this.icon,
    required this.validate,
    required this.controller,
    this.obscure = false, // default false
  });

  @override
  State<CustomTextfaield> createState() => _CustomTextfaieldState();
}

class _CustomTextfaieldState extends State<CustomTextfaield> {
  late bool _obscureText;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.obscure;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      validator: widget.validate,
      obscureText: _obscureText,
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
        ),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        label: Text(widget.label),
        prefixIcon: widget.icon,
        suffixIcon: widget.obscure
            ? IconButton(
                icon: Icon(
                  _obscureText ? Icons.visibility_off : Icons.visibility,
                ),
                onPressed: () {
                  setState(() {
                    _obscureText = !_obscureText;
                  });
                },
              )
            : null,
      ),
    );
  }
}
