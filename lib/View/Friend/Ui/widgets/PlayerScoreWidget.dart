import 'package:flutter/material.dart';
import 'package:xo_play/Core/Theming/decoration/decoration.dart';
import 'package:xo_play/Core/Theming/fonts/fonts.dart';

class PlayerScoreWidget extends StatelessWidget {
  const PlayerScoreWidget({
    super.key,
    required this.score,
    required this.charis,
    required this.your_turn,
  });

  final String score;
  final String charis;
  final bool your_turn;  

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 110,
      decoration: CustomDecoration.ScoreDecorationForX_O(your_turn),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            charis,
            style: styling.subtitle.copyWith(
              fontSize: 55,
              fontFamily: 'first',
            ),
          ),
          Text(
            'Score',
            style: styling.subtitle.copyWith(fontSize: 20),
          ),
          Text(
            score,
            style: styling.subtitle.copyWith(fontSize: 40, fontFamily: 'first'),
          ),
        ],
      ),
    );
  }
}
