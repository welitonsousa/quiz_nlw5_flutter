class ModelQuiz {
  String title;
  int? totalQuestion;
  List<ModelQuestion> questions;
  int indexActualResponse;
  bool isComplete;
  String icon;

  ModelQuiz({
    required this.title,
    required this.questions,
    required this.icon,
    required this.isComplete,
    required this.indexActualResponse,
  }) {
    this.totalQuestion = this.questions.length;
  }
}

class ModelQuestion {
  final String title;
  final int indexCorrect;
  final List<String> responses;

  ModelQuestion({
    required this.title,
    required this.indexCorrect,
    required this.responses,
  }) : assert(responses.length > 1);
}
