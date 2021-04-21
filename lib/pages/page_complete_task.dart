import 'package:flutter/material.dart';
import 'package:quiz/controllets/controller_task_question.dart';
import 'package:quiz/models/model_task_question.dart';
import 'package:quiz/widgets/widget_linear_progress_indicartor.dart';

class PageTask extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: AnimatedBuilder(
        builder: (BuildContext context, Widget? child) {
          ModelTaskQuestion question =
              ControllerTaskQuestion.instance.question!;
          int indexQuestion = ControllerTaskQuestion.instance.indexQuestion;
          return Scaffold(
            appBar: _appBar(question, indexQuestion),
            body: _body(question, indexQuestion),
            floatingActionButton: _floatingActionButton(context),
          );
        },
        animation: ControllerTaskQuestion.instance,
      ),
    );
  }

  PreferredSize _appBar(ModelTaskQuestion question, int indexQuestion) {
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
                Text('Questão $indexQuestion'),
                Text('de ${ControllerTaskQuestion.instance.totalQuestion - 1}'),
              ],
            ),
            WidgetLinearProgressIndicator(
              counterProgress: indexQuestion,
              counterTotalTask:
                  ControllerTaskQuestion.instance.totalQuestion - 1,
            ),
            Text(
              question.question,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }

  Widget _body(ModelTaskQuestion question, int indexQuestion) {
    return ListView.builder(
      itemCount: question.responses.length,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          child: RadioListTile<int>(
            title: Text('${question.responses[index]}'),
            value: index,
            groupValue: ControllerTaskQuestion.instance.indexSelected,
            onChanged: (int? value) {
              int newValue = int.parse(value.toString());
              ControllerTaskQuestion.instance.changeSelectedQuestion(newValue);
            },
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            boxShadow: [BoxShadow(color: _color(question, index))],
            color: _colorBG(question, index),
          ),
        );
      },
    );
  }

  Widget _floatingActionButton(BuildContext context) {
    return FloatingActionButton(
        onPressed: () async {
          bool response =
              await ControllerTaskQuestion.instance.verifyResponse();
          if (response) {
            Navigator.pop(context);
          }
        },
        child: Icon(Icons.navigate_next_outlined));
  }

  Color _color(ModelTaskQuestion question, int index) {
    if (ControllerTaskQuestion.instance.showCorrect) {
      if (question.indexCorrect == index) return Colors.green;
      return Colors.red;
    }
    return Colors.black;
  }

  Color _colorBG(ModelTaskQuestion question, int index) {
    if (ControllerTaskQuestion.instance.showCorrect) {
      if (question.indexCorrect == index) return Colors.green;
      return Colors.red;
    }
    return Colors.white;
  }
}
