import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:health/health.dart';
import 'package:niu_app/Constant/colors.dart';
import 'package:niu_app/utils/snackbar.dart';
import 'package:niu_app/widgets/appbar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
  }

  @override
  Widget build(BuildContext context) {
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
      body: Center(
        child: Text("$_getSteps"),
      ),
    );
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