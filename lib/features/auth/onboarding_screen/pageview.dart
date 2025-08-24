import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:todoapp/features/auth/onboarding_screen/Startscreen2.dart';
import 'package:todoapp/features/auth/onboarding_screen/Startscreen3.dart';
import 'package:todoapp/features/auth/onboarding_screen/Startscreen4.dart';
import 'package:todoapp/features/auth/onboarding_screen/startscreen1.dart';

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
              Startscreen1(),
              Startscreen2(),
              Startscreen3(),
              Startscreen4(),
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
