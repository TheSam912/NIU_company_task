import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:niu_app/Constant/styles.dart';

Widget homeScreen_statusbar(BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      FadeInLeft(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Text(
            "Welcome Back,\nSam 👋",
            style: titleStyle,
          ),
        ),
      ),
      FadeInRight(
        child: Padding(
          padding: const EdgeInsets.only(right: 18),
          child: IconButton(
              onPressed: () {
                Navigator.pushNamed(context, 'Settings');
              },
              icon: Image.asset(
                "assets/images/settings.png",
                width: 25,
                height: 25,
                fit: BoxFit.fitHeight,
              )),
        ),
      )
    ],
  );
}
