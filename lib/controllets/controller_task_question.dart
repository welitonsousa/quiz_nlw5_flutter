import 'package:flutter/cupertino.dart';
import 'package:quiz/controllets/controller_modalits.dart';
import 'package:quiz/data/questions.dart';
import 'package:quiz/models/model_modalits.dart';
import 'package:quiz/models/model_task_question.dart';

class ControllerTaskQuestion extends ChangeNotifier {
  static final ControllerTaskQuestion instance = ControllerTaskQuestion();
  int _indexActualQuestion = 0;
  int _indexSelectecQuestion = 0;

  bool _showCorrect = false;
  ModelModalits _modalits = ControllerModalits
      .instante.modalits[ControllerModalits.instante.indexModalit];

  Tasks get task => _modalits.tasks[ControllerModalits.instante.indexModalit];
  List<ModelTaskQuestion> get questions => task.questions;
  ModelTaskQuestion? get question => task.questions[_indexActualQuestion];
  int get indexQuestion => _indexActualQuestion;
  int get indexSelected => _indexSelectecQuestion;
  int get totalResponses => question!.responses.length;
  bool get showCorrect => _showCorrect;
  int get totalQuestion => task.questions.length;
  void changeSelectedQuestion(int newIndex) {
    _indexSelectecQuestion = newIndex;
    notifyListeners();
  }

  Future<bool> verifyResponse() async {
    _showCorrect = true;
    notifyListeners();
    await Future.delayed(Duration(seconds: 1));
    _showCorrect = false;

    if (totalQuestion > _indexActualQuestion + 1) {
      _indexActualQuestion += 1;
      notifyListeners();
      return false;
    }
    notifyListeners();
    return true;
  }
}
