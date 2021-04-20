import 'package:quiz/constants/gradients.dart';
import 'package:quiz/constants/images.dart';
import 'package:quiz/widgets/widget_progress_bar.dart';
import 'package:flutter/material.dart';

class WidgetAppBar extends PreferredSize {
  WidgetAppBar()
      : super(
          preferredSize: Size.fromHeight(100),
          child: Container(
            decoration: BoxDecoration(gradient: AppGradients.linear),
            child: _childContainer(),
          ),
        );

  static Widget _childContainer() {
    return Stack(
      children: [
        _profileBar(),
        _cardContainer(),
      ],
    );
  }

  static Widget _profileBar() {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Weliton Sousa',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          Container(
            height: 45,
            width: 45,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(image: NetworkImage(AppImages.profile)),
            ),
          )
        ],
      ),
    );
  }

  static Widget _cardContainer() {
    return Transform.translate(
      offset: Offset(0.1, 70.0),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: Colors.white,
            boxShadow: <BoxShadow>[BoxShadow(color: Colors.black45)],
          ),
          child: Row(
            children: [
              Expanded(child: WidgetProgressBarCircular()),
              _infoCardContainer()
            ],
          ),
        ),
      ),
    );
  }

  static Widget _infoCardContainer() {
    return Expanded(
      flex: 2,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Vamos começar',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          Text('Complete os desafios e siga em frente'),
        ],
      ),
    );
  }
}
