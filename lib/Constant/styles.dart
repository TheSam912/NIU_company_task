import 'package:flutter/material.dart';

import 'colors.dart';

TextStyle titleStyle =
    TextStyle(color: mainColor, fontWeight: FontWeight.bold, fontSize: 20);
TextStyle whiteTitleStyle =
    TextStyle(color: white, fontWeight: FontWeight.bold, fontSize: 20);
TextStyle greyText = TextStyle(color: grey, fontSize: 12);
Duration animDuration = const Duration(milliseconds: 1000);
BoxDecoration stepsContainerDecoration = BoxDecoration(
    gradient: LinearGradient(colors: primaryG),
    borderRadius: BorderRadius.circular(25));
