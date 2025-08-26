import 'package:flutter/material.dart';
import 'package:todoapp/core/style_manegares/colors.dart';
import 'package:todoapp/core/style_manegares/text_style.dart';

class GroupTile extends StatelessWidget {
  const GroupTile({super.key, required this.onTap, required this.title});
  final VoidCallback onTap;
  final String title;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: const Color.fromARGB(255, 2, 17, 30),
              spreadRadius: 2,
              blurRadius: BorderSide.strokeAlignOutside,
              blurStyle: BlurStyle.normal,
              offset: Offset(5, 6),
            ),
          ],
          borderRadius: BorderRadius.circular(12),
          color: Appcolors.primaryColor,
        ),
        child: Center(child: Text(title, style: CustmizedTextStyle.headerText)),
      ),
    );
  }
}
