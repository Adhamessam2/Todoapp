import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:todoapp/core/style_manegares/colors.dart';

class Button2 extends StatelessWidget {
  const Button2({
    super.key,
    required this.lable,
    required this.icon,
    required this.color,
    required this.onTap,
  });
  final String lable;
  final IconData icon;
  final Color color;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: width * 0.06,
          vertical: height * 0.03,
        ),
        decoration: BoxDecoration(
          color: Appcolors.lightblue,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          children: [
            Icon(icon, color: color, size: 30),
            Text(lable, style: TextStyle(color: Appcolors.lightblue)),
          ],
        ),
      ),
    );
  }
}
