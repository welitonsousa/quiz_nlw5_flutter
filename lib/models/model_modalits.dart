import 'package:quiz/models/model_task_question.dart';

class ModelModalits {
  final List<Tasks> tasks;
  final String titleModalit;

  ModelModalits({required this.tasks, required this.titleModalit});
}

class Tasks {
  final List<ModelTaskQuestion> questions;

  Tasks({required this.questions});
}
