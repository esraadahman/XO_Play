import 'package:flutter/material.dart';
import 'package:xo_play/Core/Theming/colors/colors.dart';
import 'package:xo_play/Core/Theming/fonts/fonts.dart';


class AppbarWidget extends StatelessWidget {
  const AppbarWidget({
    super.key,
    required this.text,
    required this.ontap,
  });
  final String text;
  final VoidCallback ontap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(
              Icons.arrow_back_ios_new,
              size: 35,
              color: ColorsClass.text,
            )),
        Text(
          text,
          style: styling.maintitle,
        ),
        IconButton(
            onPressed: ontap,
            icon: const Icon(
              Icons.restart_alt_rounded,
              size: 35,
              color: ColorsClass.text,
            )),
      ],
    );
  }
}