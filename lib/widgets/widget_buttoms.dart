import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quiz/constants/colors.dart';

class Buttoms {
  static Widget show({
    required String label,
    required VoidCallback onPressed,
    Color colorFont = Colors.white,
    Color? colorBG,
    bool border = true,
  }) {
    colorBG = colorBG ?? AppColors.darkGreen;
    return Container(
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: colorBG,
        borderRadius: BorderRadius.circular(10),
        border:
            Border.all(color: border ? AppColors.border : Colors.transparent),
      ),
      child: TextButton(
        onPressed: onPressed,
        child: Text(
          label,
          style: TextStyle(color: colorFont),
        ),
      ),
    );
  }
}
