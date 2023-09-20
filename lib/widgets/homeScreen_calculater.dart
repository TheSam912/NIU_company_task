import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:niu_app/widgets/rounded_button.dart';
import 'package:niu_app/widgets/step_circular_progress.dart';

import '../Constant/colors.dart';
import '../Constant/strings.dart';
import '../Constant/styles.dart';

Widget homeScreen_calculater(
    double width, ValueNotifier<double> valueNotifier, int _getSteps) {
  return FadeInUp(
    duration: animDuration,
    child: Container(
      padding: const EdgeInsets.symmetric(vertical: 20),
      margin: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
      decoration: stepsContainerDecoration,
      child: Stack(alignment: Alignment.center, children: [
        Image.asset(
          "assets/images/bg_dots.png",
          height: width * 0.4,
          width: double.maxFinite,
          fit: BoxFit.fitHeight,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 25),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    today,
                    style: TextStyle(
                        color: white,
                        fontSize: 18,
                        fontWeight: FontWeight.w700),
                  ),
                  Text(
                    "Normal avg steps per day:",
                    style:
                        TextStyle(color: white.withOpacity(0.8), fontSize: 14),
                  ),
                  Text(
                    "5,340",
                    style: TextStyle(
                        color: white.withOpacity(0.8),
                        fontSize: 16,
                        fontWeight: FontWeight.w800),
                  ),
                  SizedBox(
                    height: width * 0.05,
                  ),
                  SizedBox(
                      width: 140,
                      height: 40,
                      child: RoundButton(
                          title: "Your's: $_getSteps",
                          type: RoundButtonType.bgSGradient,
                          fontSize: 12,
                          fontWeight: FontWeight.w800,
                          onPressed: () {}))
                ],
              ),
              stepCalculatorProgressIndicator(valueNotifier)
            ],
          ),
        ),
      ]),
    ),
  );
}
