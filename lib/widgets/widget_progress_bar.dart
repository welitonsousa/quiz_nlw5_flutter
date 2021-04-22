import 'package:quiz/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:quiz/controllets/controller_task_question.dart';

class WidgetProgressBarCircular extends StatelessWidget {
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
              value: ControllerQuizes.i.globalProgress,
              strokeWidth: 8,
              backgroundColor: AppColors.chartSecondary,
              valueColor: AlwaysStoppedAnimation<Color>(AppColors.chartPrimary),
            ),
          ),
          Container(
            width: 80,
            child: Text(
              "${(ControllerQuizes.i.globalProgress * 100).toStringAsFixed(0)} %",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
