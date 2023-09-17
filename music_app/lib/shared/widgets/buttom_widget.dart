import 'package:flutter/material.dart';
import 'package:music_app/core/app/music_app_colors.dart';
import 'package:music_app/shared/widgets/text_widget.dart';

class ButtomWidget extends StatelessWidget {
  final VoidCallback onPressed;
  final String title;

  const ButtomWidget({super.key, required this.onPressed, required this.title});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: TextWidget.bold(title),
      style: ElevatedButton.styleFrom(
          backgroundColor: MusicAppColors.tertiaryColor),
    );
  }
}
