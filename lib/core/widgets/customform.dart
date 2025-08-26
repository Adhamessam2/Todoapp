import 'package:flutter/material.dart';

class Customtextformfield extends StatefulWidget {
  final String label;
  final IconData? icon;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final bool ispassword;

  Customtextformfield({
    super.key,
    required this.label,
    required this.icon,
    this.validator,
    this.controller,
    required this.ispassword,
  });

  @override
  State<Customtextformfield> createState() => _CustomtextformfieldState();
}

class _CustomtextformfieldState extends State<Customtextformfield> {
  bool isVisibl = true;

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
          validator: widget.validator,
          controller: widget.controller,
          obscureText: widget.ispassword ? isVisibl : false,
          decoration: InputDecoration(
            hintText: widget.label,
            hintStyle: TextStyle(color: Colors.black),
            prefixIcon: Icon(widget.icon, color: Colors.black),
            suffixIcon: widget.ispassword
                ? GestureDetector(
                    onTap: () {
                      setState(() {
                        isVisibl = !isVisibl;
                      });
                    },
                    child: Icon(Icons.visibility),
                  )
                : null,
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
