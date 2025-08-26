import 'package:flutter/material.dart';
import 'package:todoapp/core/style_manegares/colors.dart';

class OptionsWidget extends StatelessWidget {
  const OptionsWidget({
    super.key,
    required this.icon,
    required this.title,
    required this.onTap,
  });
  final IconData icon;
  final String title;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.all(12),
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: const Color.fromARGB(255, 2, 17, 30),
              spreadRadius: 2,
              blurRadius: BorderSide.strokeAlignOutside,
              blurStyle: BlurStyle.normal,
              offset: Offset(5, 6), // X, Y position
            ),
          ],
          color: Appcolors.blue,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Icon(icon, size: 40, color: Colors.white),
            Text(title, style: TextStyle(color: Colors.white, fontSize: 24)),
          ],
        ),
      ),
    );
  }
}
