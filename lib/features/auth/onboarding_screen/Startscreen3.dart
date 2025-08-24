import 'package:flutter/material.dart';
import 'package:todoapp/core/style_manegares/colors.dart';
import 'package:todoapp/core/style_manegares/commonstyle.dart';
<<<<<<< HEAD
=======

>>>>>>> 116215518713043e19efadcac2ff35bab4379d96

class Startscreen3 extends StatefulWidget {
  const Startscreen3({super.key});

  @override
  State<Startscreen3> createState() => _Startscreen3State();
}

class _Startscreen3State extends State<Startscreen3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Appcolors.blue, Appcolors.navyblue],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 160),

              child: Image.asset('assets/team.png'),
            ),
            SizedBox(height: 40),
            Text(
              ' create a team task, invite\n people and manage your\n         work together',
              style: Customstyle.mystyle,
            ),
            SizedBox(height: 200),
          ],
        ),
      ),
    );
  }
}
