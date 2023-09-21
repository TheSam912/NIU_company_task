import 'package:flutter/material.dart';
import 'package:niu_app/Constant/colors.dart';
import 'package:niu_app/helpers/get_steps_android.dart';
import 'package:niu_app/helpers/get_steps_ios.dart';

import '../helpers/check_platform.dart';
import '../widgets/homeScreen_appbar.dart';
import '../widgets/homeScreen_calculater.dart';
import '../widgets/homeScreen_statusbar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //define variables for Circular progress indicator
  late ValueNotifier<double> valueNotifier;

  int _getSteps = 0;
  int keyForRepaint = 0;

  String? deviceType;

  @override
  void initState() {
    super.initState();
    deviceType = check();
    switch (deviceType) {
      case "Android":
        debugPrint("----------------Device type is Android----------------");
        fetchStepDataAndroid();
        break;
      case "IOS":
        debugPrint("----------------Device type is IOS----------------");
        fetchStepDataIOS(context);
        break;
      default:
    }
    valueNotifier = ValueNotifier(0.0);
  }

  @override
  void dispose() {
    super.dispose();
    valueNotifier.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: white,
      body: FutureBuilder(
        future: deviceType == "Android"
            ? fetchStepDataAndroid()
            : fetchStepDataIOS(context),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
                child: CircularProgressIndicator(
              color: primaryColor1,
            ));
          } else {
            _getSteps = snapshot.data;
            valueNotifier.value = _getSteps.toDouble();
            return SingleChildScrollView(
                child: Column(
              children: [
                homeScreen_appbar(size.width),
                homeScreen_statusbar(context),
                homeScreen_calculater(size.width, valueNotifier, _getSteps),
              ],
            ));
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              valueNotifier.value = _getSteps.toDouble();
            });
          },
          backgroundColor: secondaryColor1,
          child: const Icon(Icons.refresh)),
    );
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
