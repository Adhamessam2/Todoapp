import 'package:flutter/material.dart';
import 'package:todoapp/core/style_manegares/colors.dart';

class Button extends StatelessWidget {
  const Button({
    super.key,
    required this.addFun,
    required this.lable,
    required this.size,
  });
  final VoidCallback addFun;
  final String lable;
  final String size;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    double getWidth() {
      if (size == 'big') {
        return width * 0.8;
      } else if (size == 'mid') {
        return width * 0.6;
      } else if (size == 'small') {
        return width * 0.4;
      }
      return width * 0.7;
    }

    return GestureDetector(
      onTap: addFun,
      child: Container(
        height: height * 0.06,
        width: getWidth(),
        decoration: BoxDecoration(
          color: Appcolors.primaryColor,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(
          child: Text(
            lable,
            style: TextStyle(color: Colors.white, fontSize: 24),
          ),
        ),
      ),
    );
  }
}
