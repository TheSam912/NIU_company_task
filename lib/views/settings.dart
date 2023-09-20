import 'package:flutter/material.dart';
import 'package:niu_app/Constant/colors.dart';

import '../widgets/appbar.dart';
import '../widgets/settingsItemBox.dart';
import '../widgets/user_box.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(62),
          child: myAppbar("Settings", [])),
      body: Column(
        children: [settingsItemBox(110, userBox("user.png", "Sobhan"))],
      ),
    );
  }
}
