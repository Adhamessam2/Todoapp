import 'package:flutter/material.dart';
<<<<<<<< HEAD:lib/Auth/features/onboarding/Startscreen3.dart
import 'package:todoapp/core/colors.dart';
import 'package:todoapp/core/commonstyle.dart';
import 'package:todoapp/Auth/features/onboarding/Startscreen4.dart';
import 'package:todoapp/Auth/features/widgets/buttons.dart';
import 'package:todoapp/Auth/features/widgets/dashs.dart';
========
import 'package:todoapp/core/style_manegares/colors.dart';
import 'package:todoapp/core/style_manegares/commonstyle.dart';
import 'package:todoapp/core/widegts/buttons.dart';
import 'package:todoapp/features/auth/onboarding_screen/widgets/dashs.dart';


import 'Startscreen4.dart';
>>>>>>>> 955978f2ac158795e90fde44dbb385c8143f1701:lib/features/auth/onboarding_screen/Startscreen3.dart

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
                        MaterialPageRoute(builder: (context) => Startscreen4()),
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
