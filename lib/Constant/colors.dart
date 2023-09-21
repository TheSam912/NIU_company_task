import 'package:flutter/material.dart';

Color white = const Color.fromARGB(255, 255, 255, 255);
Color black = const Color.fromARGB(255, 18, 17, 17);
Color grey = const Color.fromARGB(255, 55, 55, 55);
Color mainColor = const Color.fromRGBO(49, 39, 79, 1);
Color shadowColor = const Color.fromRGBO(196, 135, 198, .3);

Color get primaryColor1 => const Color(0xff92A3FD);
Color get primaryColor2 => const Color(0xff9DCEFF);

Color get secondaryColor1 => const Color(0xffC58BF2);
Color get secondaryColor2 => const Color(0xffEEA4CE);

List<Color> get primaryG => [mainColor, primaryColor1];
List<Color> get secondaryG => [secondaryColor2, secondaryColor1];
