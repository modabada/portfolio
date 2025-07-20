import 'package:flutter/material.dart';

@immutable
class Background extends StatelessWidget {
  const Background({super.key});

  @override
  Widget build(final BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    return DecoratedBox(
      decoration: BoxDecoration(
        color: colorScheme.surface,
      ),
      child: const SizedBox.expand(),
    );
  }
}
