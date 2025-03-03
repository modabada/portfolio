import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/Component/NavBar/anim_element.dart';
import 'package:portfolio/router.dart';

@immutable
class NavBar extends StatefulWidget {
  const NavBar({super.key});

  double get widgetHeight => 90;

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
    final Icon locatorIcon = Icon(
      Icons.location_on,
      size: widget.widgetHeight,
      color: colorScheme.primary,
    );
    final Icon locatorDragIcon = Icon(
      Icons.location_on_outlined,
      size: widget.widgetHeight,
      color: colorScheme.secondary,
    );
    final Icon homeIcon = Icon(
      Icons.home_rounded,
      size: widget.widgetHeight,
      color: colorScheme.primary,
    );

    return DefaultTextStyle(
      style: Theme.of(context).textTheme.headlineSmall!,
      child: Wrap(
        children: <Widget>[
          Draggable<int>(
            data: 0,
            childWhenDragging: SizedBox(
              width: widget.widgetHeight,
              child: locatorDragIcon,
            ),
            feedback: SizedBox(
              width: widget.widgetHeight,
              child: locatorIcon,
            ),
            child: SizedBox(
              width: widget.widgetHeight,
              child: locatorIcon,
            ),
          ),
          Container(
            width: widget.widgetHeight * 4,
            height: widget.widgetHeight,
            alignment: Alignment.center,
            child: const Text(
              '왼쪽 아이콘을 이동하고싶은\n아이콘으로 드래그하세요',
              textAlign: TextAlign.center,
              softWrap: false,
            ),
          ),
          AnimatedElement(
            width: widget.widgetHeight,
            customElement: homeIcon,
            navigatePath: homePageRoute,
          ),
          AnimatedElement(
            width: widget.widgetHeight * 2,
            element: const Text('About'),
            navigatePath: aboutPageRoute,
          ),
          AnimatedElement(
            width: widget.widgetHeight * 2,
            element: const Text('School'),
            navigatePath: schoolPageRoute,
          ),
          AnimatedElement(
            width: widget.widgetHeight * 2,
            element: const Text('Projects'),
            navigatePath: projectsPageRoute,
          ),
          AnimatedElement(
            width: widget.widgetHeight * 2,
            element: const Text('Award'),
            navigatePath: awardPageRoute,
          ),
          AnimatedElement(
            width: widget.widgetHeight * 2,
            element: const Text('Resume'),
            navigatePath: resumePageRoute,
          ),
        ],
      ),
    );
  }
}
