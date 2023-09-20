import 'package:animate_do/animate_do.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:niu_app/Constant/styles.dart';
import 'package:niu_app/Constant/snackbar.dart';

import '../states/auth_state.dart';
import '../states/storage_state.dart';

Widget loginButton(BuildContext context, TextEditingController emailController,
    TextEditingController passwordController, WidgetRef ref) {
  return FadeInUp(
    duration: animDuration,
    child: GestureDetector(
      onTap: () async {
        if (emailController.text.isNotEmpty &&
            passwordController.text.isNotEmpty) {
          final authArgs = AuthArgs(
            email: emailController.text,
            password: passwordController.text,
          );
          if (emailController.text == "sam@nolan" &&
              passwordController.text == "123") {
            ref.read(authLoginProvider(authArgs));

            final isAuthenticated = ref.read(getIsAuthenticatedProvider);
            if (isAuthenticated.value!) {
              Navigator.pushNamed(context, 'Home');
            }
          } else {
            showSnackBar(context, ContentType.failure, "Oh NO!",
                "Username or password is not correct");
          }
        } else {
          showSnackBar(context, ContentType.failure, "On Snap!",
              "Fill all the fields please !!");
        }
      },
      child: Container(
        height: 50,
        margin: const EdgeInsets.symmetric(horizontal: 60),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: const Color.fromRGBO(49, 39, 79, 1),
        ),
        child: const Center(
          child: Text(
            "Login",
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    ),
  );
}
