import 'package:flutter/material.dart';
import 'package:xo_play/Core/Theming/decoration/decoration.dart';
import 'package:xo_play/Core/Theming/fonts/fonts.dart';

class ScoreWidget extends StatelessWidget {
  const ScoreWidget({
    super.key,
    required this.score,
  });

  final String score;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: 150,
      padding:const EdgeInsets.only(top: 14, left: 5),
      decoration: CustomDecoration.ScoreDecouration(),
      child: Text(
        "Draw :$score",
        style: styling.subtitle.copyWith(
          fontSize: 17,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
