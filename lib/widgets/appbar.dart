import 'package:flutter/material.dart';

import '../Constant/colors.dart';
import '../Constant/styles.dart';

Widget myAppbar(String title, List<Widget> action) {
  return AppBar(
    title: Text(
      title,
      style: titleStyle,
    ),
    backgroundColor: white,
    elevation: 0,
    actions: action,
  );
}
