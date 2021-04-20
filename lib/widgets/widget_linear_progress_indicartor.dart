import 'package:flutter/material.dart';
import 'package:quiz/constants/colors.dart';

class WidgetLinearProgressIndicator extends StatelessWidget {
  final int counterProgress;
  final int counterTotalTask;

  WidgetLinearProgressIndicator(
      {required this.counterProgress, required this.counterTotalTask});
  @override
  Widget build(BuildContext context) {
    return LinearProgressIndicator(
      backgroundColor: AppColors.chartSecondary,
      value: (counterProgress * counterTotalTask) / 100,
      valueColor: AlwaysStoppedAnimation<Color>(AppColors.chartPrimary),
    );
  }
}
