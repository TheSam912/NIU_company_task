import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:health/health.dart';

import '../Constant/snackbar.dart';

Future fetchStepDataIOS(BuildContext context) async {
  HealthFactory healthIOS = HealthFactory();
  int? steps;
  var types = [HealthDataType.STEPS];
  final now = DateTime.now();
  final midnight = DateTime(now.year, now.month, now.day);
  var permission = [HealthDataAccess.READ];
  bool requested =
      await healthIOS.requestAuthorization(types, permissions: permission);
  if (requested) {
    try {
      steps = await healthIOS.getTotalStepsInInterval(midnight, now);
    } catch (e) {
      debugPrint(e.toString());
    }

    print("----------------IOS total steps: $steps----------------");
  } else {
    // ignore: use_build_context_synchronously
    showSnackBar(
        context, ContentType.failure, "Oh! Snap", "permission not granted");
  }
  return steps;
}
