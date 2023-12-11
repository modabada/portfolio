import 'package:flutter/material.dart';
import 'package:portfolio/Component/NavBar/nav_bar.dart';
import 'package:portfolio/Component/background.dart';

const TextStyle textStyle = TextStyle(
  fontSize: 24,
  color: Colors.white,
);
const TextStyle accent = TextStyle(
  color: Colors.lightBlue,
);
const TextStyle small = TextStyle(
  fontSize: 16,
);
const TextStyle medium = TextStyle(
  fontSize: 36,
);
const TextStyle large = TextStyle(
  fontSize: 48,
);
const TextStyle largeAccent = TextStyle(
  fontSize: 48,
  color: Colors.lightBlue,
);

abstract class DefaultTemplate extends StatelessWidget {
  const DefaultTemplate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      textStyle: textStyle,
      child: Stack(
        children: [
          const Background(),
          body(context),
          const NavBar(),
        ],
      ),
    );
  }

  Widget body(BuildContext context);
}
