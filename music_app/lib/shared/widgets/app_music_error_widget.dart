import 'package:flutter/material.dart';
import 'package:music_app/shared/widgets/text_widget.dart';

import 'buttom_widget.dart';

class AppMusicErrorWidget extends StatelessWidget {
  final String error;
  final VoidCallback? onTryAgain;

  const AppMusicErrorWidget({super.key, required this.error, this.onTryAgain});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextWidget.normal(
          error,
          textAlign: TextAlign.center,
        ),
        SizedBox(
          height: 12,
        ),
        if (onTryAgain != null)
          ButtomWidget(
            title: 'Tentar novamente',
            onPressed: onTryAgain!,
          ),
      ],
    );
  }
}
