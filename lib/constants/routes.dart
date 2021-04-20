import 'package:quiz/pages/pages_home.dart';
import 'package:flutter/cupertino.dart';

class AppRouters {
  static final String initial = "Home";
  static final Map<String, Widget Function(BuildContext)> value = {
    'Home': (BuildContext context) => PageHome(),
  };
}
