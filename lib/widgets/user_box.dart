import 'package:flutter/material.dart';
import 'package:niu_app/Constant/colors.dart';

Widget userBox(String image, String text, String type) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 12),
            child: ClipOval(
              child: Image(
                image: AssetImage('assets/images/$image'),
                fit: BoxFit.contain,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 0),
            child: Text(
              type == "user" ? "Hello $text 👋" : text,
              style: TextStyle(
                  fontSize: 18, fontWeight: FontWeight.bold, color: mainColor),
            ),
          )
        ],
      ),
      Padding(
        padding: const EdgeInsets.only(right: 12),
        child: Icon(
          Icons.keyboard_arrow_right,
          color: mainColor,
        ),
      )
    ],
  );
}
