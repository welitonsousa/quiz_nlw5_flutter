import 'package:flutter/material.dart';
import 'package:quiz/widgets/widget_linear_progress_indicartor.dart';

class WidgetProgressCard extends StatelessWidget {
  final String image;
  final String label;
  final int counterProgress;
  final int counterTotalTask;
  final Function onTap;
  WidgetProgressCard({
    required this.image,
    required this.label,
    required this.counterProgress,
    required this.counterTotalTask,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(),
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: <BoxShadow>[BoxShadow(color: Colors.black45)],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 35,
              width: 35,
              child: Image.asset(image),
            ),
            Text(label, style: TextStyle(fontWeight: FontWeight.bold)),
            Row(
              children: [
                Text('$counterProgress de $counterTotalTask  '),
                Expanded(
                  child: WidgetLinearProgressIndicator(
                    counterProgress: counterProgress,
                    counterTotalTask: counterTotalTask,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
