import 'package:flutter/material.dart';

import '../../../../shared/widgets/screen_widget.dart';

class GenreListScreen extends StatelessWidget {
  static const routeName = '/genre-list';

  @override
  Widget build(BuildContext context) {
    return ScreenWidget(
      isLoading: false,
      title: 'Lista de generos',
      child: Container(),
    );
  }
}
