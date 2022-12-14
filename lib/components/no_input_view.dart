

import 'package:flutter/material.dart';

class NoInputView extends StatelessWidget {
  const NoInputView({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      'No Input detected.\n\nEither share something to the app or press the generate button with something in your clipboard.',
      textAlign: TextAlign.center,
      style: Theme.of(context).textTheme.headline6,
    );
  }
}