import 'package:flutter/material.dart';
import 'package:todoapp/core/colors.dart';
import 'package:todoapp/core/commonstyle.dart';
import 'package:todoapp/Auth/features/onboarding/Startscreen2.dart';
import 'package:todoapp/Auth/features/widgets/buttons.dart';

import 'package:todoapp/Auth/features/widgets/dashs.dart';

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
