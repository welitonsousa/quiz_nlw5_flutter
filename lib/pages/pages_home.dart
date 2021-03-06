import 'package:quiz/controllets/controller_quiz.dart';
import 'package:quiz/models/enums/state_connection.dart';
import 'package:quiz/widgets/widget_appbar.dart';
import 'package:quiz/widgets/widget_level_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:quiz/widgets/widget_progress_card.dart';

class PageHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: AnimatedBuilder(
        animation: ControllerQuizes.i,
        builder: (BuildContext context, Widget? child) {
          if (ControllerQuizes.i.status == Status.loading) {
            ControllerQuizes.i.getQuizes();
            return Scaffold(body: Center(child: CircularProgressIndicator()));
          }

          return Scaffold(
            appBar: WidgetAppBar(),
            body: _body(context),
          );
        },
      ),
    );
  }

  static Widget _body(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;
    return Column(
      children: [
        Container(height: 80),
        Container(
          height: 40,
          width: MediaQuery.of(context).size.width,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: _leveis.length,
            itemBuilder: (_, int index) {
              return Level.button(
                label: _leveis[index],
                onPressed: () {},
              );
            },
          ),
        ),
        Container(height: 20),
        Expanded(
          child: GridView.builder(
            padding: EdgeInsets.symmetric(horizontal: 5),
            itemCount: ControllerQuizes.i.quizes!.length,
            gridDelegate: _sliverGrid(orientation),
            itemBuilder: (BuildContext context, int index) {
              final quiz = ControllerQuizes.i.quizes![index];
              return Padding(
                padding: const EdgeInsets.all(8),
                child: WidgetProgressCard(
                  image: quiz.icon,
                  counterProgress: quiz.indexActualResponse,
                  counterTotalTask: quiz.totalQuestion!,
                  label: quiz.title,
                  onTap: () async {
                    ControllerQuizes.i.setIndexQuizSelected(index);
                    await Navigator.pushNamed(context, 'Quiz');
                  },
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  static List<String> _leveis = ["F??cil", "M??dio", "Dif??cil", "Pertito"];

  static SliverGridDelegateWithFixedCrossAxisCount _sliverGrid(orientation) {
    return SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: (orientation == Orientation.portrait) ? 2 : 3);
  }
}
