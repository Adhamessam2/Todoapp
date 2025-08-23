import 'package:flutter/material.dart';
import 'package:todoapp/core/style_manegares/colors.dart';
import 'package:todoapp/core/style_manegares/commonstyle.dart';
import 'package:todoapp/features/auth/onboarding_screen/Startscreen3.dart';
import 'package:todoapp/core/widegts/buttons.dart';
import 'package:todoapp/features/auth/onboarding_screen/widgets/dashs.dart';


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
            Padding(
              padding: const EdgeInsets.only(right: 50),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Dash(width: 20),
                  const SizedBox(width: 8),
                  Dash(width: 40),
                  const SizedBox(width: 8),
                  Dash(width: 20),
                  const SizedBox(width: 40),
                  Forwardbutton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Startscreen3()),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
