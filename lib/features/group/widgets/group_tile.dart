import 'package:flutter/material.dart';
import 'package:todoapp/core/style_manegares/colors.dart';
import 'package:todoapp/core/style_manegares/commonstyle.dart';

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
          color: Appcolors.navyblue,
        ),
        child: Center(child: Text(title, style: Customstyle.headerText)),
      ),
    );
  }
}
