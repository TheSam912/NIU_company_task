import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:niu_app/Constant/colors.dart';
import '../Constant/styles.dart';
import '../states/auth_state.dart';
import '../widgets/banner.dart';
import '../widgets/input_box.dart';
import '../widgets/login_button.dart';
import '../widgets/spacer_30dp.dart';

class LoginScreen extends HookConsumerWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final width = MediaQuery.of(context).size.width;

    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();
    ref.listen(authErrorMessageProvider, (prev, next) {
      if (next.isNotEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(next),
          ),
        );
      } else {
        emailController.text = '';
        passwordController.text = '';
      }
    });

    return Scaffold(
      backgroundColor: white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            bannerImage(width),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  FadeInLeft(
                    duration: animDuration,
                    child: Text(
                      "Login",
                      style: titleStyle,
                    ),
                  ),
                  spacer30dp(),
                  boxInput(emailController, passwordController),
                  spacer30dp(),
                  spacer30dp(),
                  loginButton(
                      context, emailController, passwordController, ref),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
