import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:niu_app/Constant/colors.dart';

import '../states/storage_state.dart';
import '../widgets/appbar.dart';
import '../widgets/settingsItemBox.dart';
import '../widgets/user_box.dart';

class SettingsScreen extends HookConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: white,
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(62),
          child: myAppbar("Settings", [], context)),
      body: Column(
        children: [
          settingsItemBox(110, userBox("user.png", "Sobhan", "user")),
          GestureDetector(
              onTap: () async {
                final isCleared = await ref.read(resetStorage);
                if (isCleared) {
                  // ignore: use_build_context_synchronously
                  Navigator.popAndPushNamed(context, 'Login');
                }
              },
              child: settingsItemBox(60, userBox("logout.png", "LogOut", "")))
        ],
      ),
    );
  }
}
