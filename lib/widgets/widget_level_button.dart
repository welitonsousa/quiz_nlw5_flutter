import 'package:flutter/material.dart';
import 'package:quiz/constants/colors.dart';

class Level {
  static Color? _colorLabel;
  static Color? _colorBackground;
  static Color? _colorBorder;

  static Widget button({
    required Function onPressed,
    required String label,
  }) {
    selectLevelColor(label);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        width: 100,
        child: TextButton(
          child: Text(
            label,
            style: TextStyle(color: _colorLabel),
          ),
          onPressed: () => onPressed,
        ),
        decoration: BoxDecoration(
          color: _colorBackground,
          border: Border.all(color: _colorBorder!),
          borderRadius: BorderRadius.circular(30),
        ),
      ),
    );
  }

  static void selectLevelColor(String level) {
    if (level == "Fácil") {
      _colorLabel = AppColors.levelButtonTextFacil;
      _colorBorder = AppColors.levelButtonBorderFacil;
      _colorBackground = AppColors.levelButtonFacil;
    } else if (level == "Médio") {
      _colorLabel = AppColors.levelButtonTextMedio;
      _colorBorder = AppColors.levelButtonBorderMedio;
      _colorBackground = AppColors.levelButtonMedio;
    } else if (level == "Difícil") {
      _colorLabel = AppColors.levelButtonTextDificil;
      _colorBorder = AppColors.levelButtonBorderDificil;
      _colorBackground = AppColors.levelButtonDificil;
    } else {
      _colorLabel = AppColors.levelButtonTextPerito;
      _colorBorder = AppColors.levelButtonBorderPerito;
      _colorBackground = AppColors.levelButtonPerito;
    }
  }
}
