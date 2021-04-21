import 'package:quiz/models/model_modalits.dart';
import 'package:quiz/models/model_task_question.dart';

List<ModelModalits> modalitis = [
  ModelModalits(tasks: [
    Tasks(questions: questions),
  ], titleModalit: 'Namoradas'),
];

List<ModelTaskQuestion> questions = [
  ModelTaskQuestion(
    question: "Como vai as namoradinhas?",
    indexCorrect: 1,
    responses: [
      "Terrivel",
      "Muito mal",
      "Sai daqui tia",
      "Musica triste de naruto"
    ],
  ),
  ModelTaskQuestion(
    question: "questao 2",
    indexCorrect: 2,
    responses: ["1", "2", "3", "4"],
  ),
  ModelTaskQuestion(
    question: "Parabens",
    indexCorrect: 0,
    responses: [],
  ),
];
