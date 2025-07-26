import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/Component/NavBar/dark_mode_button.dart';
import 'package:portfolio/Component/NavBar/nav_bar_route_button.dart';
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
        color: colorScheme.inversePrimary.withAlpha((1 / 255 * 0.8).round()),
        height: widget.widgetHeight,
        width: double.infinity,
        child: Row(
          children: <Widget>[
            NavBarRouteButton(
              element: homeIcon,
              navigatePath: homePageRoute,
            ),
            const Expanded(
              child: NavBarRouteButton(
                element: Text('About'),
                navigatePath: aboutPageRoute,
              ),
            ),
            const Expanded(
              child: NavBarRouteButton(
                element: Text('School'),
                navigatePath: schoolPageRoute,
              ),
            ),
            const Expanded(
              child: NavBarRouteButton(
                element: Text('Projects'),
                navigatePath: projectsPageRoute,
              ),
            ),
            const Expanded(
              child: NavBarRouteButton(
                element: Text('Award'),
                navigatePath: awardPageRoute,
              ),
            ),
            const Expanded(
              child: NavBarRouteButton(
                element: Text('Resume'),
                navigatePath: resumePageRoute,
              ),
            ),
            const DarkModeButton(),
          ],
        ),
      ),
    );
  }
}
