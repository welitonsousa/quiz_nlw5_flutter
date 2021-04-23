import 'package:quiz/pages/page_quiz.dart';
import 'package:quiz/pages/page_splash.dart';
import 'package:quiz/pages/pages_home.dart';
import 'package:flutter/cupertino.dart';

class AppRouters {
  static final String initial = "Splash";
  static final Map<String, Widget Function(BuildContext)> value = {
    'Splash': (BuildContext context) => PageSplash(),
    'Home': (BuildContext context) => PageHome(),
    'Quiz': (BuildContext context) => PageQuiz(),
  };
}
