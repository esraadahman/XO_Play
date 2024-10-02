import 'package:flutter/material.dart';
import 'package:xo_play/Core/Theming/colors/colors.dart';
import 'package:xo_play/Core/Theming/fonts/fonts.dart';

class AlertWidget extends StatelessWidget {
  const AlertWidget({
    super.key,
    required this.text,
  });
  final String text;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: ColorsClass.sub_primary, // Set custom background color
      title: Center(
        child: Text(
          'Game Over',
          style: styling.subtitle,
        ),
      ),
      content: SingleChildScrollView(
        // Wrap content in a ScrollView if needed
        child: Padding(
          padding: const EdgeInsets.symmetric(
              vertical: 8.0), // Adjust padding as needed
          child: Center(
            child: Text(
              'The Winner is $text',
              textAlign: TextAlign.center, // Center the text inside the dialog
              style: styling.subtitle.copyWith(
                fontSize: 18,
              ), // Adjust style if necessary
            ),
          ),
        ),
      ),
      contentPadding:
          const EdgeInsets.all(16.0), // Adjust content padding to reduce height
    );
  }
}
