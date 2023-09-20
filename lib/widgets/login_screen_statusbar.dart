import 'package:animate_do/animate_do.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';

import '../Constant/colors.dart';
import '../Constant/snackbar.dart';
import '../Constant/styles.dart';

Widget loginScreen_statusbar(BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      FadeInLeft(
        duration: animDuration,
        child: Text(
          "Login",
          style: titleStyle,
        ),
      ),
      FadeInRight(
          child: IconButton(
              onPressed: () {
                showSnackBar(context, ContentType.help, "Login Access",
                    "Username:sam@Nolan\nPassword:123");
              },
              icon: Icon(
                Icons.help,
                color: mainColor,
              )))
    ],
  );
}
