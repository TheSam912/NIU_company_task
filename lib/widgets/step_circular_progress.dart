import 'package:flutter/material.dart';
import 'package:simple_circular_progress_bar/simple_circular_progress_bar.dart';

import '../Constant/colors.dart';

Widget stepCalculatorProgressIndicator(ValueNotifier<double> valueNotifier) {
  return Padding(
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
                fontWeight: FontWeight.bold, fontSize: 12, color: white),
          );
        },
      ),
    ),
  );
}
