import 'package:quiz/constants/colors.dart';
import 'package:quiz/constants/routes.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          accentColor: Colors.green,
          textTheme: TextTheme(bodyText2: TextStyle(color: AppColors.grey))),
      initialRoute: AppRouters.initial,
      routes: AppRouters.value,
    );
  }
}
