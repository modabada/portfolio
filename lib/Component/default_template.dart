import 'package:flutter/material.dart';
import 'package:portfolio/Component/NavBar/nav_bar.dart';
import 'package:portfolio/Component/background.dart';

abstract class DefaultTemplate extends StatelessWidget {
  const DefaultTemplate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      style: Theme.of(context).textTheme.labelMedium!,
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
