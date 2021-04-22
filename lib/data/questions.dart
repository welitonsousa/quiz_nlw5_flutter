import 'package:quiz/constants/images.dart';
import 'package:quiz/models/model_task_question.dart';

List<ModelQuiz> dataquizes = [
  ModelQuiz(
    title: 'Namoradinhas',
    questions: questions,
    icon: AppImages.blocks,
    indexActualResponse: 0,
    isComplete: false,
  ),
  ModelQuiz(
    title: 'Gerenciamento de estado',
    questions: questions,
    icon: AppImages.blocks,
    indexActualResponse: 1,
    isComplete: false,
  ),
  ModelQuiz(
    title: 'Estrutura de pastas',
    questions: questions,
    icon: AppImages.blocks,
    indexActualResponse: 2,
    isComplete: false,
  )
];

List<ModelQuestion> questions = [
  ModelQuestion(
    title: 'Como vai as namoradinhas??',
    indexCorrect: 2,
    responses: ["1", "Muito mal", "Pessimo", "Mimimi"],
  ),
  ModelQuestion(
    title: '2',
    indexCorrect: 2,
    responses: ["2", "Muito mal", "Pessimo", "Mimimi"],
  ),
  ModelQuestion(
    title: '3',
    indexCorrect: 2,
    responses: ["3", "Muito mal", "Pessimo", "Mimimi"],
  ),
];
