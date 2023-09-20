import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:health/health.dart';
import 'package:niu_app/Constant/colors.dart';
import 'package:niu_app/Constant/styles.dart';
import 'package:niu_app/utils/snackbar.dart';
import 'package:niu_app/widgets/appbar.dart';

import '../utils/rounded_button.dart';

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
    return Scaffold(
        backgroundColor: white,
        appBar: PreferredSize(
            preferredSize: const Size.fromHeight(62),
            child: myAppbar(
                "NIU",
                [
                  IconButton(
                      onPressed: () {
                        Navigator.pushNamed(context, 'Settings');
                      },
                      icon: Icon(
                        Icons.settings,
                        color: white,
                      ))
                ],
                context)),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12, vertical: 15),
                    child: Text(
                      "Welcome Back,\nSobhan 👋",
                      style: titleStyle,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 12),
                    child: IconButton(
                        onPressed: () {},
                        icon: Image.asset(
                          "assets/images/notification_active.png",
                          width: 25,
                          height: 25,
                          fit: BoxFit.fitHeight,
                        )),
                  )
                ],
              ),
              Container(
                height: size.width * 0.4,
                decoration: BoxDecoration(
                    gradient: LinearGradient(colors: primaryG),
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
                              "BMI (Body Mass Index)",
                              style: TextStyle(
                                  color: white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700),
                            ),
                            Text(
                              "You have a normal weight",
                              style: TextStyle(
                                  color: white.withOpacity(0.7), fontSize: 12),
                            ),
                            SizedBox(
                              height: size.width * 0.05,
                            ),
                            SizedBox(
                                width: 120,
                                height: 35,
                                child: RoundButton(
                                    title: "View More",
                                    type: RoundButtonType.bgSGradient,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    onPressed: () {}))
                          ],
                        ),
                      ],
                    ),
                  )
                ]),
              ),
              RepaintBoundary(
                child: GestureDetector(
                  key: ValueKey(keyForRepaint),
                  onTap: () {
                    valueNotifier.value = 100.0;
                    keyForRepaint++;
                    setState(() {});
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'SELECT THE THICKNESS OF THE LINES',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: black,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ));
  }
}

// Center(
//         child: Text("$_getSteps"),
//       ),

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