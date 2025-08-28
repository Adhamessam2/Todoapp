import 'package:flutter/material.dart';
import 'package:todoapp/core/style_manegares/colors.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Appcolors.blue, Appcolors.navyblue],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Scaffold(backgroundColor: Colors.transparent),
    );
  }
}
