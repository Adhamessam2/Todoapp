import 'package:flutter/material.dart';

class CustmizedTextField extends StatelessWidget {
  const CustmizedTextField({
    super.key,
    required this.lable,
    required this.ctrl,
  });
  final String lable;
  final TextEditingController ctrl;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextField(
        decoration: InputDecoration(labelText: lable),
        controller: ctrl,
      ),
    );
  }
}
