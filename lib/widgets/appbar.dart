import 'package:flutter/material.dart';

import '../Constant/colors.dart';
import '../Constant/styles.dart';

Widget myAppbar(String title, List<Widget> action, BuildContext context) {
  return AppBar(
    title: Text(
      title,
      style: whiteTitleStyle,
    ),
    backgroundColor: mainColor,
    elevation: 0,
    actions: action,
    leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Icon(
          Icons.keyboard_arrow_left_rounded,
          color: white,
        )),
  );
}
