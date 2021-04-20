import 'package:flutter/material.dart';
import 'package:quiz/widgets/widget_linear_progress_indicartor.dart';

class PageTask extends StatelessWidget {
  final int counterTotalTask;
  final int counterProgress;
  PageTask({required this.counterTotalTask, required this.counterProgress});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: _appBar(),
      ),
    );
  }

  PreferredSize _appBar() {
    return PreferredSize(
      preferredSize: Size.fromHeight(120),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Questão $counterProgress'),
                Text('de $counterTotalTask'),
              ],
            ),
            WidgetLinearProgressIndicator(
              counterProgress: counterProgress,
              counterTotalTask: counterTotalTask,
            ),
            Text(
              'O que o Flutter faz em sua totalidade?',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
