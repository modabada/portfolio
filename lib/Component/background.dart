import 'package:flutter/material.dart';

@immutable
class Background extends StatelessWidget {
  const Background({super.key});

  @override
  Widget build(final BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    return DecoratedBox(
      decoration: BoxDecoration(
        color: colorScheme.background,
      ),
      child: const SizedBox.expand(),
    );
  }
}
