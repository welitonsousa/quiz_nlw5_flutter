import 'package:flutter/cupertino.dart';
import 'package:quiz/data/questions.dart';
import 'package:quiz/models/enums/state_connection.dart';
import 'package:quiz/models/model_task_question.dart';

class ControllerQuizes extends ChangeNotifier {
  static final i = ControllerQuizes();

  List<ModelQuiz>? quizes;
  int indexQuizSelected = 0;

  Status status = Status.loading;
  bool showResponse = false;
  int _indexResponseSelected = 0;
  double _globalProgress = 0;

  int get indexResponseSelected => _indexResponseSelected;
  double get globalProgress => _globalProgress;

  void getQuizes() async {
    try {
      status = Status.loading;
      notifyListeners();

      await Future.delayed(Duration(seconds: 2));
      quizes = dataquizes;
      _calculateProgress();
      status = Status.success;
    } catch (error) {
      status = Status.error;
    } finally {
      notifyListeners();
    }
  }

  void _calculateProgress() {
    int totalQuestions = 0;
    int totalResponses = 0;

    quizes!.forEach((quiz) {
      totalQuestions += quiz.totalQuestion!;
      totalResponses += quiz.indexActualResponse;
    });

    _globalProgress =
        totalResponses > 0 ? (totalResponses / totalQuestions) : 0;
  }

  void changeResponseSelected(int newValue) {
    _indexResponseSelected = newValue;
    notifyListeners();
  }

  void _nextQuestion() {
    int indexQuiz = indexQuizSelected;
    ModelQuiz quiz = quizes![indexQuiz];
    int indexQuestion = quiz.indexActualResponse;

    if (quiz.questions.length - 1 == indexQuestion) {
      quizes![indexQuiz].isComplete = true;
    }
    if (quiz.questions.length > indexQuestion) {
      quizes![indexQuiz].indexActualResponse += 1;
    }
    _calculateProgress();
    notifyListeners();
  }

  Future<void> showResponses() async {
    if (!showResponse) {
      showResponse = true;
      notifyListeners();
      await Future.delayed(Duration(seconds: 2));
      showResponse = false;
      _indexResponseSelected = 0;
      _nextQuestion();
      notifyListeners();
    }
  }
}
