import 'package:flutter/material.dart';
import 'package:quiz/constants/colors.dart';
import 'package:quiz/constants/images.dart';
import 'package:quiz/controllets/controller_quiz.dart';
import 'package:quiz/models/model_task_question.dart';
import 'package:quiz/widgets/widget_buttoms.dart';
import 'package:share_plus/share_plus.dart';

class PageCompletedQuiz extends StatelessWidget {
  static ModelQuiz? _quiz;
  PageCompletedQuiz(ModelQuiz quiz) {
    _quiz = quiz;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body(),
    );
  }

  static Widget _body() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(AppImages.trophy),
          _text(label: 'Parabéns!', size: 30),
          _text(label: 'Você concluiu'),
          _text(label: '${_quiz!.title}', bold: true, size: 25),
          _text(
              label: 'com ${_quiz!.counterRigths} de ${_quiz!.totalQuestion!}'),
          Container(height: 20),
          Buttoms.show(
            label: 'Compartilhar',
            colorBG: AppColors.purple,
            onPressed: () {
              Share.share(
                  'Quiz NLW#5: obtive ${(_quiz!.counterRigths / _quiz!.totalQuestion!) * 100} % de acertos');
            },
          ),
          Buttoms.show(
            label: 'Tentar novamente',
            colorBG: Colors.transparent,
            colorFont: AppColors.grey,
            border: false,
            onPressed: ControllerQuizes.i.resetQuiz,
          ),
        ],
      ),
    );
  }

  static Text _text(
      {required String label, bool bold = false, double size = 20}) {
    return Text(
      label,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: size,
        color: AppColors.grey,
        fontWeight: bold ? FontWeight.bold : FontWeight.normal,
      ),
    );
  }
}
