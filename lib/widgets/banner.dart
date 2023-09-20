import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:niu_app/Constant/styles.dart';

Widget bannerImage(var width) {
  return FadeInDown(
    duration: animDuration,
    child: SizedBox(
      height: 400,
      child: Stack(
        children: <Widget>[
          Positioned(
              top: -40,
              height: 400,
              width: width,
              child: Container(
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/background.png'),
                        fit: BoxFit.fill)),
              )),
          Positioned(
              height: 400,
              width: width + 20,
              child: Container(
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/background-2.png'),
                        fit: BoxFit.fill)),
              ))
        ],
      ),
    ),
  );
}
