import 'package:flutter/cupertino.dart';
import 'package:quiz/data/questions.dart';
import 'package:quiz/models/enums/state_connection.dart';
import 'package:quiz/models/model_task_question.dart';

class ControllerQuizes extends ChangeNotifier {
  static final i = ControllerQuizes();

  List<ModelQuiz>? quizes;
  int _indexQuizSelected = 0;

  Status status = Status.loading;
  bool showResponse = false;
  int _indexResponseSelected = 0;
  double _globalProgress = 0;
  PageController pageController = PageController();

  int get indexResponseSelected => _indexResponseSelected;
  double get globalProgress => _globalProgress;
  int get indexQuizSelected => _indexQuizSelected;

  void setIndexQuizSelected(int newQuiz) {
    _indexQuizSelected = newQuiz;
    pageController = PageController(
        initialPage: quizes![_indexQuizSelected].indexActualResponse);
  }

  void getQuizes() async {
    try {
      status = Status.loading;
      notifyListeners();

      //time of request
      await Future.delayed(Duration(milliseconds: 1));

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
    ModelQuiz quiz = quizes![indexQuizSelected];
    int indexQuestion = quiz.indexActualResponse;

    if (quiz.questions.length - 1 == indexQuestion) {
      quizes![indexQuizSelected].isComplete = true;
    }
    if (quiz.questions.length > indexQuestion) {
      quizes![indexQuizSelected].indexActualResponse += 1;
    }
    _calculateProgress();
    notifyListeners();
  }

  void resetQuiz() {
    quizes![indexQuizSelected].counterRigths = 0;
    quizes![indexQuizSelected].indexActualResponse = 0;
    quizes![indexQuizSelected].isComplete = false;
    pageController.animateToPage(0,
        duration: Duration(seconds: 1), curve: Curves.linearToEaseOut);
    notifyListeners();
  }

  Future<void> showResponses({bool skip = false}) async {
    if (!showResponse) {
      ModelQuiz quiz = quizes![indexQuizSelected];
      ModelQuestion question = quiz.questions[quiz.indexActualResponse];

      if (!skip && question.indexCorrect == _indexResponseSelected) {
        quizes![indexQuizSelected].counterRigths += 1;
      }
      showResponse = true;
      notifyListeners();
      await Future.delayed(Duration(seconds: 1));
      showResponse = false;
      _indexResponseSelected = 0;
      _nextQuestion();
      notifyListeners();
    }
  }
}
