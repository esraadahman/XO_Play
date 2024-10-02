import 'package:flutter/material.dart';
import 'package:xo_play/Core/Theming/colors/colors.dart';

class CustomDecoration {
  static BoxDecoration decorationForCenterContainer() {
    return const BoxDecoration(
        gradient: LinearGradient(
            colors: [ColorsClass.sub_background, ColorsClass.primary],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter));
  }

  static BoxDecoration ScoreDecouration() {
    return BoxDecoration(
        color: ColorsClass.sub_primary,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: ColorsClass.background, width: 2.0));
  }

  static BoxDecoration ScoreDecorationForX_O(bool isTurn) {
    return BoxDecoration(
      color: isTurn
          ? ColorsClass.primary
          : ColorsClass
              .sub_primary, // Change background if it's the player's turn
      borderRadius: BorderRadius.circular(20),
      border: Border.all(
        color: ColorsClass.background,
        width: isTurn ? 4.0 : 2.0, // Thicker border if it's the player's turn
      ),
    );
  }
}
