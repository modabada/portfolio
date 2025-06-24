import 'package:flutter/material.dart';

@immutable
class Background extends StatelessWidget {
  const Background({super.key});

  @override
  Widget build(final BuildContext context) => const DecoratedBox(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: <Color>[
              Color.fromARGB(255, 19, 19, 50),
              Color.fromARGB(255, 15, 14, 38),
              Color.fromARGB(255, 12, 10, 26),
            ],
            stops: <double>[0, 0.35, 0.7],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
      );
}
