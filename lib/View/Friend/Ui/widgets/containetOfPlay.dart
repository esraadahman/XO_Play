import 'package:flutter/material.dart';
import 'package:xo_play/Core/Theming/fonts/fonts.dart';
import 'package:xo_play/View/Friend/cubit/cubit/friend_cubit.dart';

class ContainerOfPlay extends StatelessWidget {
  const ContainerOfPlay({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(width: 5.0),
      ),
      child: Center(
          child: Text(text,
              style: styling.maintitle.copyWith(
                fontSize: 55,
              ))),
    );
  }
}
