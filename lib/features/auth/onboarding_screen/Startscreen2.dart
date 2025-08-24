import 'package:flutter/material.dart';
import 'package:todoapp/core/style_manegares/colors.dart';
import 'package:todoapp/core/style_manegares/commonstyle.dart';

class Startscreen2 extends StatefulWidget {
  const Startscreen2({super.key});

  @override
  State<Startscreen2> createState() => _Startscreen2State();
}

class _Startscreen2State extends State<Startscreen2> {
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
              padding: const EdgeInsets.only(top: 100),

              child: Image.asset('assets/calendar.png'),
            ),
            SizedBox(height: 40),
            Text(
              ' Make a full schedule for\n the whole week and stay\n organized and productive\n                all days',
              style: Customstyle.mystyle,
            ),
            SizedBox(height: 200),
          ],
        ),
      ),
    );
  }
}
