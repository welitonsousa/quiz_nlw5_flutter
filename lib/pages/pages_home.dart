import 'package:quiz/constants/images.dart';
import 'package:quiz/widgets/widget_appbar.dart';
import 'package:quiz/widgets/widget_level_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:quiz/widgets/widget_progress_card.dart';

class PageHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: WidgetAppBar(),
        body: _body(context),
      ),
    );
  }

  Widget _body(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 80, left: 20, right: 20),
      child: Column(
        children: [
          Container(
            height: 40,
            width: MediaQuery.of(context).size.width,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: _levelsButtons(),
            ),
          ),
          Container(height: 20),
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              children: _cards(context),
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _levelsButtons() {
    return [
      Level.button(
        label: 'Fácil',
        onPressed: () {},
      ),
      Level.button(
        label: 'Médio',
        onPressed: () {},
      ),
      Level.button(
        label: 'Difícil',
        onPressed: () {},
      ),
      Level.button(
        label: 'Perito',
        onPressed: () {},
      ),
    ];
  }

  List<Widget> _cards(BuildContext context) {
    return [
      WidgetProgressCard(
          image: AppImages.check,
          counterProgress: 3,
          counterTotalTask: 10,
          label: 'Gerenciamento de estado',
          onTap: () => Navigator.pushNamed(context, 'Task')),
      WidgetProgressCard(
        counterProgress: 3,
        counterTotalTask: 10,
        image: AppImages.check,
        label: 'Teste',
        onTap: () {},
      ),
      WidgetProgressCard(
        counterProgress: 10,
        counterTotalTask: 10,
        image: AppImages.check,
        label: 'Teste',
        onTap: () {},
      )
    ];
  }
}
