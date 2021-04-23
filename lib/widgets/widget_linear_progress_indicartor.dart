import 'package:flutter/material.dart';
import 'package:quiz/constants/colors.dart';

class WidgetLinearProgressIndicator extends StatelessWidget {
  final int counterProgress;
  final int counterTotalTask;

  WidgetLinearProgressIndicator({
    required this.counterProgress,
    required this.counterTotalTask,
  });
  @override
  Widget build(BuildContext context) {
    return LinearProgressIndicator(
      backgroundColor: AppColors.chartSecondary,
      value: counterProgress > 0 ? counterProgress / counterTotalTask : 0,
      valueColor: AlwaysStoppedAnimation<Color>(AppColors.chartPrimary),
    );
  }
}

class WidgetLinearProgressIndicatorAnimated extends StatelessWidget {
  final int counterProgress;
  final int counterTotalTask;

  WidgetLinearProgressIndicatorAnimated({
    required this.counterProgress,
    required this.counterTotalTask,
  });
  @override
  Widget build(BuildContext context) {
    double percent =
        counterProgress > 0 ? counterProgress / counterTotalTask : 0;
    double width = MediaQuery.of(context).size.width * percent;
    return Stack(
      children: [
        Container(
          height: 10,
          decoration: BoxDecoration(
            color: AppColors.chartSecondary,
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        AnimatedContainer(
          height: 10,
          width: width,
          duration: Duration(seconds: 1),
          decoration: BoxDecoration(
            color: AppColors.chartPrimary,
            borderRadius: BorderRadius.circular(10),
          ),
        )
      ],
    );
  }
}
