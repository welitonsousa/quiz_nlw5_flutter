import 'package:quiz/constants/images.dart';
import 'package:quiz/models/model_task_question.dart';

List<ModelQuiz> dataquizes = [
  ModelQuiz(
    title: 'Gerenciamento de estados',
    questions: questions,
    icon: AppImages.blocks,
    indexActualResponse: 0,
    isComplete: false,
    counterRigths: 0,
  ),
  ModelQuiz(
    title: 'Arquivo pos build',
    questions: history,
    icon: AppImages.data,
    indexActualResponse: 0,
    isComplete: false,
    counterRigths: 0,
  ),
  ModelQuiz(
    title: 'Assuntos tecnicos',
    questions: tecnics,
    icon: AppImages.laptop,
    indexActualResponse: 0,
    isComplete: false,
    counterRigths: 0,
  ),
];

List<ModelQuestion> tecnics = [
  ModelQuestion(
    title: "Como criar um enum?",
    indexCorrect: 2,
    responses: [
      "Enum myEnum = {estado1, estedo2, estado3}",
      "Enum MyEnum = {estado1, estedo2, estado3}",
      "enum myEnum {estado1, estedo2, estado3}",
      "enum myEnum = {estado1, estedo2, estado3}"
    ],
  ),
  ModelQuestion(
    title:
        "Como permitir a declaração de uma variavel sem inicialização usando o null safety?",
    indexCorrect: 0,
    responses: [
      "int? myVar",
      "int MyVar",
      "int myVar?",
      "int myVar!",
    ],
  ),
  ModelQuestion(
    title:
        "Como usar uma variavel que foi inicialisada como null, usando o null safety?",
    indexCorrect: 2,
    responses: [
      "final response = myVar",
      "final response? = myVar",
      "final response = myVar!",
      "final! response = myVar",
    ],
  ),
  ModelQuestion(
    title: "Flutter se destaca pelo fato de:",
    indexCorrect: 3,
    responses: [
      "Suas animações",
      "Ser muito facil de ser entendido",
      "Ter um otimo desempenho",
      "Todas as alternativas",
    ],
  ),
];

List<ModelQuestion> history = [
  ModelQuestion(
    title: "Qual o tamanho medio de uma arquivo apk gerado pelo Flutter?",
    indexCorrect: 2,
    responses: [
      "Entre 11 a 20 mb",
      "Maior que 50 mb",
      "Menos que 10 mb",
      "Entre 30 a 40 mb",
    ],
  )
];

List<ModelQuestion> questions = [
  ModelQuestion(
    title: "Ultilizamos o statefullwidget quando queremos",
    indexCorrect: 0,
    responses: [
      "Atualizar um valor em tela",
      "Atualizar um valor em um controller",
      "Para poder passar parametros entre telas",
      "Quando queremos uma tela estatica",
    ],
  ),
  ModelQuestion(
    title: "initState ocorre",
    indexCorrect: 1,
    responses: [
      "Toda vez que a tela tem um novo build",
      "Uma inica vez dirante a inicialização da tela",
      "Uma inica vez quando a tela é fechada",
      "Toda vez que ocorre uma chamada setState",
    ],
  ),
  ModelQuestion(
    title: "Quando algo dentro de uma função dispose é executado?",
    indexCorrect: 3,
    responses: [
      "Sempre que ocorre um novo build",
      "Sempre que ocorre uma chamada setState",
      "Toda vez que o usuario clica na tela",
      "Ocorre sempre que a tela é fechada",
    ],
  ),
];
