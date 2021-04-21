class ModelTaskQuestion {
  final int indexCorrect;
  final String question;
  final List<String> responses;

  ModelTaskQuestion(
      {required this.question,
      required this.indexCorrect,
      required this.responses});
}
