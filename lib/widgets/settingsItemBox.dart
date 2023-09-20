import 'package:flutter/material.dart';
import 'package:niu_app/Constant/colors.dart';

Widget settingsItemBox(double height, Widget child) {
  return Container(
    height: height,
    margin: const EdgeInsets.all(20),
    padding: const EdgeInsets.all(8),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: white,
        boxShadow: [
          BoxShadow(
            color: shadowColor,
            blurRadius: 20,
            offset: const Offset(0, 10),
          )
        ]),
    child: child,
  );
}
