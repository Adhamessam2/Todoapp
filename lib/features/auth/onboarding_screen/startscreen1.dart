import 'package:flutter/material.dart';
<<<<<<<< HEAD:lib/Auth/features/onboarding/startscreen1.dart
import 'package:todoapp/core/colors.dart';
import 'package:todoapp/core/commonstyle.dart';
import 'package:todoapp/Auth/features/onboarding/Startscreen2.dart';
import 'package:todoapp/Auth/features/widgets/buttons.dart';

import 'package:todoapp/Auth/features/widgets/dashs.dart';
========
import 'package:todoapp/core/style_manegares/colors.dart';
import 'package:todoapp/core/style_manegares/commonstyle.dart';
import 'package:todoapp/features/auth/onboarding_screen/Startscreen2.dart';
import 'package:todoapp/core/widegts/buttons.dart';
import 'package:todoapp/features/auth/onboarding_screen/widgets/dashs.dart';
>>>>>>>> 955978f2ac158795e90fde44dbb385c8143f1701:lib/features/auth/onboarding_screen/startscreen1.dart

class Startscreen1 extends StatelessWidget {
  const Startscreen1({super.key});

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

              child: Image.asset('assets/notepad icon .png'),
            ),
            SizedBox(height: 40),
            Text(
              ' Plan your tasks to do, that\n way you’ll stay organized\n and you won’t skip any',
              style: Customstyle.mystyle,
            ),
            SizedBox(height: 200),
            Padding(
              padding: const EdgeInsets.only(right: 50),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Dash(width: 40),
                  const SizedBox(width: 8),
                  Dash(width: 20),
                  const SizedBox(width: 8),
                  Dash(width: 20),
                  const SizedBox(width: 40),
                  Forwardbutton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Startscreen2()),
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
