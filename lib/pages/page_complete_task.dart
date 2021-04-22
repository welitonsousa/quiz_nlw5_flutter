import 'package:flutter/material.dart';
import 'package:quiz/controllets/controller_task_question.dart';
import 'package:quiz/models/model_task_question.dart';
import 'package:quiz/widgets/widget_linear_progress_indicartor.dart';

class PageTask extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: AnimatedBuilder(
        animation: ControllerQuizes.i,
        builder: (BuildContext context, Widget? child) {
          int indexQuiz = ControllerQuizes.i.indexQuizSelected;
          ModelQuiz quiz = ControllerQuizes.i.quizes![indexQuiz];
          int indexQuestion = quiz.indexActualResponse;
          ModelQuestion? question;

          if (quiz.isComplete) {
            question = quiz.questions[indexQuestion - 1];
            return Scaffold(
              appBar: _appBar(quiz),
              body: winThisQuiz(),
            );
          }
          question = quiz.questions[indexQuestion];

          return Scaffold(
            appBar: _appBar(quiz),
            body: quiz.isComplete ? winThisQuiz() : _body(question),
            floatingActionButton: _floatingActionButton(context),
          );
        },
      ),
    );
  }

  PreferredSize _appBar(ModelQuiz quiz) {
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
                Text('Questão ${quiz.indexActualResponse}'),
                Text('de ${quiz.totalQuestion}'),
              ],
            ),
            WidgetLinearProgressIndicator(
              counterProgress: quiz.indexActualResponse,
              counterTotalTask: quiz.totalQuestion!,
            ),
            Text(
              quiz.isComplete
                  ? ""
                  : quiz.questions[quiz.indexActualResponse].title,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }

  Widget winThisQuiz() {
    return Center(child: Text("Você terminou este Quiz"));
  }

  Widget _body(ModelQuestion question) {
    return ListView.builder(
      itemCount: question.responses.length,
      itemBuilder: (_, int index) {
        final response = question.responses[index];
        return Container(
          margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          child: RadioListTile<int>(
            title: Text(
              '$response',
              style: TextStyle(color: _color(question, index)),
            ),
            activeColor: _color(question, index),
            value: index,
            groupValue: ControllerQuizes.i.indexResponseSelected,
            onChanged: (int? value) {
              int newValue = int.parse(value.toString());
              ControllerQuizes.i.changeResponseSelected(newValue);
            },
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            boxShadow: [BoxShadow(color: _color(question, index))],
            color: Colors.white,
          ),
        );
      },
    );
  }

  Widget _floatingActionButton(BuildContext context) {
    return FloatingActionButton(
      child: Icon(Icons.navigate_next_outlined),
      onPressed: () async {
        await ControllerQuizes.i.showResponses();
      },
    );
  }

  Color _color(ModelQuestion question, int index) {
    if (ControllerQuizes.i.showResponse) {
      if (question.indexCorrect == index) return Colors.green;
      return Colors.red;
    }
    return Colors.black;
  }
}
