import 'package:flutter/material.dart';
import 'package:quiz/constants/colors.dart';
import 'package:quiz/controllets/controller_task_question.dart';
import 'package:quiz/models/model_task_question.dart';
import 'package:quiz/pages/page_completed_quiz.dart';
import 'package:quiz/widgets/widget_buttoms.dart';
import 'package:quiz/widgets/widget_linear_progress_indicartor.dart';

class PageQuiz extends StatelessWidget {
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
            return PageCompletedQuiz(quiz);
          }
          question = quiz.questions[indexQuestion];

          return Scaffold(
            appBar: _appBar(context, quiz),
            body: _body(question),
            bottomNavigationBar: _buttomNavigator(),
          );
        },
      ),
    );
  }

  PreferredSize _appBar(BuildContext context, ModelQuiz quiz) {
    return PreferredSize(
      preferredSize: Size.fromHeight(100),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
              icon: Icon(Icons.close), onPressed: () => Navigator.pop(context)),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Questão ${quiz.indexActualResponse}'),
                Text('de ${quiz.totalQuestion}'),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: WidgetLinearProgressIndicatorAnimated(
              counterProgress: quiz.indexActualResponse,
              counterTotalTask: quiz.totalQuestion!,
            ),
          ),
        ],
      ),
    );
  }

  Widget _body(ModelQuestion question) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Center(
            child: Text(
              question.title,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        Expanded(
          child: ListView.builder(
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
          ),
        ),
      ],
    );
  }

  Widget _buttomNavigator() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Expanded(
          child: Buttoms.show(
              label: 'Pular',
              colorBG: AppColors.lightGrey,
              onPressed: () => ControllerQuizes.i.showResponses(skip: true)),
        ),
        Expanded(
          child: Buttoms.show(
            label: 'Confirmar',
            onPressed: () => ControllerQuizes.i.showResponses(),
          ),
        )
      ],
    );
  }

  Color _color(ModelQuestion question, int index) {
    if (ControllerQuizes.i.showResponse) {
      if (question.indexCorrect == index) return Colors.green;
      return Colors.red;
    }
    return AppColors.grey;
  }
}
