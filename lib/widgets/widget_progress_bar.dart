import 'package:quiz/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:quiz/controllets/controller_quiz.dart';

class WidgetProgressBarCircular extends StatefulWidget {
  @override
  _WidgetProgressBarCircularState createState() =>
      _WidgetProgressBarCircularState();
}

class _WidgetProgressBarCircularState extends State<WidgetProgressBarCircular>
    with SingleTickerProviderStateMixin {
  AnimationController? _controller;
  Animation<double>? animation;
  bool builded = false;
  void initAnimation() {
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 2));
    animation =
        Tween<double>(begin: 0.0, end: ControllerQuizes.i.globalProgress)
            .animate(_controller!);
    _controller!.forward();
  }

  @override
  void initState() {
    initAnimation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(right: 10),
        child: AnimatedBuilder(
          animation: animation!,
          builder: (BuildContext context, Widget? child) {
            if (animation!.value == ControllerQuizes.i.globalProgress) {
              builded = true;
            }
            return Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  width: 80,
                  height: 80,
                  child: CircularProgressIndicator(
                    value: builded
                        ? ControllerQuizes.i.globalProgress
                        : animation!.value,
                    strokeWidth: 8,
                    backgroundColor: AppColors.chartSecondary,
                    valueColor:
                        AlwaysStoppedAnimation<Color>(AppColors.chartPrimary),
                  ),
                ),
                Container(
                  width: 80,
                  child: Text(
                    "${((builded ? ControllerQuizes.i.globalProgress : animation!.value) * 100).toStringAsFixed(0)} %",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            );
          },
        ));
  }
}
