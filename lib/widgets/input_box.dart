import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:niu_app/Constant/styles.dart';
import '../Constant/colors.dart';

Widget boxInput(TextEditingController emailController,
    TextEditingController passwordController) {
  return FadeInLeft(
    duration: animDuration,
    child: Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: white,
          boxShadow: const [
            BoxShadow(
              color: Color.fromRGBO(196, 135, 198, .3),
              blurRadius: 20,
              offset: Offset(0, 10),
            )
          ]),
      child: Column(
        children: <Widget>[
          _inputBox(emailController, "Email: sam@nolan", false),
          _inputBox(passwordController, "Password: 123", true)
        ],
      ),
    ),
  );
}

Widget _inputBox(
    TextEditingController controller, String title, bool isPassword) {
  return Container(
    padding: const EdgeInsets.all(10),
    child: TextField(
      controller: controller,
      obscureText: isPassword ? true : false,
      decoration: InputDecoration(
          border: InputBorder.none,
          hintText: title,
          hintStyle: const TextStyle(color: Colors.grey)),
    ),
  );
}
