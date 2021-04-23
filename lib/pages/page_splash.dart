import 'package:flutter/material.dart';
import 'package:quiz/constants/gradients.dart';
import 'package:quiz/constants/images.dart';

class PageSplash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body(context),
    );
  }

  static Widget _body(BuildContext context) {
    Future.delayed(Duration(seconds: 2))
        .then((value) => Navigator.pushReplacementNamed(context, 'Home'));

    return Container(
      decoration: BoxDecoration(gradient: AppGradients.linear),
      child: Center(child: Image.asset(AppImages.logo, fit: BoxFit.cover)),
    );
  }
}
