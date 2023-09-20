import 'package:flutter/material.dart';

import '../Constant/styles.dart';
import 'banner.dart';

Widget homeScreen_appbar(double width) {
  return Stack(
    children: [
      bannerImage(width),
      SafeArea(
        child: Center(
          child: Text(
            "NIU",
            style: whiteTitleStyle,
          ),
        ),
      ),
    ],
  );
}
