import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:health/health.dart';
import 'package:niu_app/Constant/colors.dart';
import 'package:niu_app/Constant/snackbar.dart';
import '../widgets/homeScreen_appbar.dart';
import '../widgets/homeScreen_calculater.dart';
import '../widgets/homeScreen_statusbar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //define variables for Circlular progress indicator
  late ValueNotifier<double> valueNotifier;
  int keyForRepaint = 0;
  //variables and auth for using health app for IOS devices
  int _getSteps = 0;
  HealthFactory health = HealthFactory();

  //Define future for getting steps from health for IOS devices
  Future fetchStepData() async {
    int? steps;
    var types = [HealthDataType.STEPS];
    final now = DateTime.now();
    final midnight = DateTime(now.year, now.month, now.day);
    var permission = [HealthDataAccess.READ];
    bool requested =
        await health.requestAuthorization(types, permissions: permission);
    if (requested) {
      try {
        steps = await health.getTotalStepsInInterval(midnight, now);
      } catch (e) {
        debugPrint(e.toString());
      }
      print("----------------Total steps: $steps----------------");
      setState(() {
        _getSteps = (steps == null) ? 0 : steps;
      });
    } else {
      // ignore: use_build_context_synchronously
      showSnackBar(
          context, ContentType.failure, "Oh! Snap", "permission not granted");
    }
  }

  @override
  void initState() {
    super.initState();
    fetchStepData();
    valueNotifier = ValueNotifier(0.0);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    valueNotifier.value = _getSteps.toDouble();
    return Scaffold(
        backgroundColor: white,
        body: SingleChildScrollView(
          child: Column(
            children: [
              homeScreen_appbar(size.width),
              homeScreen_statusbar(context),
              homeScreen_calculater(size.width, valueNotifier, _getSteps),
            ],
          ),
        ));
  }
}

// Center(
//child: ref.watch(getAuthenticatedUserProvider).when(
//loading: () => const CircularProgressIndicator(),
//data: (email) => Text(email),
//error: (error, stackTrace) {
//debugPrint(error.toString());
//return const Text('User information is not available!');
//})),






