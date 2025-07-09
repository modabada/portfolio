import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/Component/NavBar/anim_element.dart';
import 'package:portfolio/router.dart';

@immutable
class NavBar extends StatefulWidget {
  const NavBar({super.key});

  double get widgetHeight => 80;

  @override
  State<NavBar> createState() => _NavBarState();

  @override
  void debugFillProperties(final DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DoubleProperty('widgetHeight', widgetHeight));
  }
}

class _NavBarState extends State<NavBar> {
  @override
  Widget build(final BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    final Icon homeIcon = Icon(
      Icons.home_rounded,
      size: widget.widgetHeight,
      color: colorScheme.primary,
    );

    return DefaultTextStyle(
      style: Theme.of(context).textTheme.headlineSmall!,
      child: Container(
        color: colorScheme.inversePrimary.withOpacity(0.8),
        height: widget.widgetHeight,
        width: double.infinity,
        child: Row(
          children: <Widget>[
            AnimatedElement(
              element: homeIcon,
              navigatePath: homePageRoute,
            ),
            const Expanded(
              child: AnimatedElement(
                element: Text('About'),
                navigatePath: aboutPageRoute,
              ),
            ),
            const Expanded(
              child: AnimatedElement(
                element: Text('School'),
                navigatePath: schoolPageRoute,
              ),
            ),
            const Expanded(
              child: AnimatedElement(
                element: Text('Projects'),
                navigatePath: projectsPageRoute,
              ),
            ),
            const Expanded(
              child: AnimatedElement(
                element: Text('Award'),
                navigatePath: awardPageRoute,
              ),
            ),
            const Expanded(
              child: AnimatedElement(
                element: Text('Resume'),
                navigatePath: resumePageRoute,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
