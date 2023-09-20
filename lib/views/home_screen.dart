import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:health/health.dart';

import 'package:niu_app/Constant/colors.dart';
import 'package:niu_app/Constant/styles.dart';
import 'package:niu_app/Constant/snackbar.dart';
import 'package:niu_app/widgets/appbar.dart';
import 'package:niu_app/widgets/banner.dart';
import 'package:simple_circular_progress_bar/simple_circular_progress_bar.dart';

import '../Constant/strings.dart';
import '../widgets/rounded_button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late ValueNotifier<double> valueNotifier;
  int keyForRepaint = 0;

  int _getSteps = 0;
  HealthFactory health = HealthFactory();
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
              Stack(
                children: [
                  bannerImage(size.width),
                  SafeArea(
                    child: Center(
                      child: Text(
                        "NIU",
                        style: whiteTitleStyle,
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Text(
                      "Welcome Back,\nSobhan 👋",
                      style: titleStyle,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 18),
                    child: IconButton(
                        onPressed: () {
                          Navigator.pushNamed(context, 'Settings');
                        },
                        icon: Image.asset(
                          "assets/images/settings.png",
                          width: 25,
                          height: 25,
                          fit: BoxFit.fitHeight,
                        )),
                  )
                ],
              ),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 20),
                margin:
                    const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
                decoration: BoxDecoration(
                    gradient: LinearGradient(colors: primaryG),
                    boxShadow: [
                      BoxShadow(
                        color: shadowColor,
                        blurRadius: 20,
                        offset: const Offset(0, 10),
                      )
                    ],
                    borderRadius: BorderRadius.circular(size.width * 0.075)),
                child: Stack(alignment: Alignment.center, children: [
                  Image.asset(
                    "assets/images/bg_dots.png",
                    height: size.width * 0.4,
                    width: double.maxFinite,
                    fit: BoxFit.fitHeight,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 25, horizontal: 25),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              today,
                              style: TextStyle(
                                  color: white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700),
                            ),
                            Text(
                              "Normal steps for male:",
                              style: TextStyle(
                                  color: white.withOpacity(0.8), fontSize: 14),
                            ),
                            Text(
                              "5,340",
                              style: TextStyle(
                                  color: white.withOpacity(0.8),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w800),
                            ),
                            SizedBox(
                              height: size.width * 0.05,
                            ),
                            SizedBox(
                                width: 140,
                                height: 40,
                                child: RoundButton(
                                    title: "Your's: $_getSteps",
                                    type: RoundButtonType.bgSGradient,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w800,
                                    onPressed: () {}))
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 12),
                          child: RepaintBoundary(
                            child: SimpleCircularProgressBar(
                              maxValue: 5340,
                              valueNotifier: valueNotifier,
                              progressStrokeWidth: 20,
                              backStrokeWidth: 10,
                              progressColors: secondaryG,
                              backColor: primaryColor2,
                              onGetText: (double value) {
                                return Text(
                                  '${value.toInt()}\nSteps',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12,
                                      color: white),
                                );
                              },
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ]),
              ),
            ],
          ),
        ));
  }
}

//  Center(
//             child: ref.watch(getAuthenticatedUserProvider).when(
//                   loading: () => const CircularProgressIndicator(),
//                   data: (email) => Text(email),
//                   error: (error, stackTrace) {
//                     debugPrint(error.toString());
//                     return const Text('User information is not available!');
//                   },
//                 ),
//           )