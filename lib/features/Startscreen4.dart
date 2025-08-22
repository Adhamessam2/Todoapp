import 'package:flutter/material.dart';
import 'package:todoapp/core/colors.dart';
import 'package:todoapp/core/commonstyle.dart';
import 'package:todoapp/features/login.dart';
import 'package:todoapp/features/widgets/buttons.dart';
import 'package:todoapp/features/widgets/dashs.dart';

class Startscreen4 extends StatefulWidget {
  const Startscreen4({super.key});

  @override
  State<Startscreen4> createState() => _Startscreen4State();
}

class _Startscreen4State extends State<Startscreen4> {
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
              child: Image.asset('assets/Shield.png'),
            ),
            SizedBox(height: 40),
            Text(
              ' You informations are\n     secure with us',
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
                  Dash(width: 20),
                  const SizedBox(width: 8),
                  Dash(width: 40),
                  const SizedBox(width: 40),
                  Forwardbutton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Loginscreen()),
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
