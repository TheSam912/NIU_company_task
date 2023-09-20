import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:niu_app/Constant/colors.dart';
import 'package:niu_app/Constant/styles.dart';
import '../states/storage_state.dart';
import '../widgets/banner.dart';
import '../widgets/settingsItemBox.dart';
import '../widgets/user_box.dart';

class SettingsScreen extends HookConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: white,
      body: Column(
        children: [
          Stack(
            children: [
              bannerImage(width),
              settingTitle(),
              settingBackButton(context)
            ],
          ),
          FadeInLeft(
              duration: animDuration,
              child:
                  settingsItemBox(110, userBox("user.png", "Sobhan", "user"))),
          FadeInLeft(
            duration: animDuration,
            child: GestureDetector(
                onTap: () async {
                  final isCleared = await ref.read(resetStorage);
                  if (isCleared) {
                    // ignore: use_build_context_synchronously
                    Navigator.popAndPushNamed(context, 'Login');
                  }
                },
                child:
                    settingsItemBox(60, userBox("logout.png", "LogOut", ""))),
          ),
          myWidget()
        ],
      ),
    );
  }
}

Widget settingTitle() {
  return SafeArea(
    child: Center(
      child: Padding(
        padding: const EdgeInsets.only(top: 15),
        child: Text(
          "Settings",
          style: whiteTitleStyle,
        ),
      ),
    ),
  );
}

Widget settingBackButton(BuildContext context) {
  return SafeArea(
    child: Positioned(
        child: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.keyboard_arrow_left,
              color: white,
            ))),
  );
}

Widget myWidget() {
  return Column(
    children: [
      const SizedBox(
        height: 60,
      ),
      Text(
        "Made by LOVE for NIU company",
        style: greyText,
      ),
      Text(
        "Sam Nolan",
        style: greyText,
      ),
      Image(
        image: const AssetImage('assets/images/logo.png'),
        width: 40,
        height: 55,
        color: mainColor,
      )
    ],
  );
}
