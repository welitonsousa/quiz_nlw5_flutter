import 'package:quiz/constants/colors.dart';
import 'package:flutter/material.dart';

double _percent = 75.0;

class WidgetProgressBarCircular extends StatelessWidget {
  WidgetProgressBarCircular({double percent: 75}) {
    _percent = percent;
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: 80,
            height: 80,
            child: CircularProgressIndicator(
              value: _percent / 100,
              strokeWidth: 8,
              backgroundColor: AppColors.chartSecondary,
              valueColor: AlwaysStoppedAnimation<Color>(AppColors.chartPrimary),
            ),
          ),
          Container(
            width: 80,
            child: Text(
              "${_percent.toStringAsFixed(0)} %",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
