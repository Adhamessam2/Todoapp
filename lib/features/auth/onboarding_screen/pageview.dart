import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'package:todoapp/features/auth/onboarding_screen/onboarding.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  PageController onboardingcontroller = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: onboardingcontroller,
            children: [
              Startscreen1(
                imagepath: 'assets/notepad icon .png',
                text:
                    ' Plan your tasks to do, that\n way you’ll stay organized\n and you won’t skip any',
                lastpage: false,
              ),
              Startscreen1(
                imagepath: 'assets/calendar.png',
                text:
                    'Organize your tasks by\n setting due dates and\n priorities',
                lastpage: false,
              ),
              Startscreen1(
                imagepath: 'assets/team.png',
                text:
                    ' create a team task, invite\n people and manage your\n         work together',
                lastpage: false,
              ),
              Startscreen1(
                imagepath: 'assets/Shield.png',
                text: ' You informations are\n     secure with us',
                lastpage: true,
              ),
            ],
          ),

          Positioned(
            bottom: 120,
            left: 160,

            child: SmoothPageIndicator(
              controller: onboardingcontroller,
              count: 4,
              effect: ExpandingDotsEffect(
                dotColor: Colors.white,
                activeDotColor: Colors.white,
                dotHeight: 10,
                dotWidth: 9,
                expansionFactor: 4, // how wide the active dot gets
              ),
            ),
          ),
        ],
      ),
    );
  }
}
