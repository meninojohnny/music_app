import 'package:flutter/material.dart';
import 'package:music_app/core/app/music_app.dart';
import 'package:music_app/core/app/music_app_text_styles.dart';

class TextWidget extends StatelessWidget {
  final String text;
  final TextStyle? style;
  final TextAlign? textAlign;

  const TextWidget(this.text, {this.style, this.textAlign, super.key});

  TextWidget.bold(this.text, {TextStyle? textStyle, this.textAlign, super.key})
      : style = textStyle ?? MusicAppTextStyles.getNormalBoldStyle;

  TextWidget.normal(this.text,
      {TextStyle? textStyle, this.textAlign, super.key})
      : style = textStyle ?? MusicAppTextStyles.getNormalStyle;

  TextWidget.title(this.text, {TextStyle? textStyle, this.textAlign, super.key})
      : style = textStyle ?? MusicAppTextStyles.getTitleStyle;

  TextWidget.small(this.text, {TextStyle? textStyle, this.textAlign, super.key})
      : style = textStyle ?? MusicAppTextStyles.getSmallType;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style,
      textAlign: textAlign,
    );
  }
}
