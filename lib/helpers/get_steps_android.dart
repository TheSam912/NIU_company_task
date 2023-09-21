import 'package:health/health.dart';

Future fetchStepDataAndroid() async {
  int? steps;
  HealthFactory healthAndroid =
      HealthFactory(useHealthConnectIfAvailable: true);
  var types = [
    HealthDataType.STEPS,
  ];
  bool requested = await healthAndroid.requestAuthorization(types);
  if (requested) {
    // fetch health data from the last 24 hours
    var now = DateTime.now();
    var midnight = DateTime(now.year, now.month, now.day);

    // request permissions to write steps and blood glucose
    types = [HealthDataType.STEPS];
    var permissions = [
      HealthDataAccess.READ_WRITE,
    ];
    await healthAndroid.requestAuthorization(types, permissions: permissions);
    // get the number of steps for today

    steps = await healthAndroid.getTotalStepsInInterval(midnight, now);
    print("----------------Android total steps: $steps----------------");
  }
  return steps;
}
