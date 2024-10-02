import 'package:flutter/material.dart';
import 'package:xo_play/Core/Theming/colors/colors.dart';

class buttonwidget extends StatelessWidget {
  const buttonwidget({
    super.key,
    required this.ontap,
    required this.text,
  });
  final String text;
  final VoidCallback ontap;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: ontap,
      style: const ButtonStyle(
          backgroundColor: WidgetStatePropertyAll(ColorsClass.background),
          fixedSize: WidgetStatePropertyAll(Size(290, 50))),
      child: Text(
        text,
        style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
            fontSize: 15,
            fontFamily: "second"),
      ),
    );
  }
}
