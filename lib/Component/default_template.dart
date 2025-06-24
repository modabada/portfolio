import 'package:flutter/material.dart';
import 'package:portfolio/Component/NavBar/nav_bar.dart';
import 'package:portfolio/Component/background.dart';

@immutable
abstract class DefaultTemplate extends StatelessWidget {
  const DefaultTemplate({super.key});

  @override
  Widget build(final BuildContext context) => DefaultTextStyle(
        style: Theme.of(context).textTheme.labelMedium!,
        child: Stack(
          children: <Widget>[
            const Background(),
            body(context),
            const NavBar(),
          ],
        ),
      );

  Widget body(final BuildContext context);
}
