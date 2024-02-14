import 'package:flutter/material.dart';
import 'package:portfolio/router.dart';
import 'package:portfolio/Component/NavBar/anim_element.dart';

class NavBar extends StatefulWidget {
  const NavBar({Key? key}) : super(key: key);
  final double widgetHeight = 90;

  @override
  State<NavBar> createState() => NavBarState();
}

class NavBarState extends State<NavBar> {
  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final locatorIcon = Icon(
      Icons.location_on,
      size: widget.widgetHeight,
      color: colorScheme.primary,
    );
    final locatorDragIcon = Icon(
      Icons.location_on_outlined,
      size: widget.widgetHeight,
      color: colorScheme.secondary,
    );
    final homeIcon = Icon(
      Icons.home_rounded,
      size: widget.widgetHeight,
      color: colorScheme.primary,
    );

    return DefaultTextStyle(
      style: Theme.of(context).textTheme.headlineSmall!,
      child: Wrap(
        children: [
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
              "왼쪽 아이콘을 이동하고싶은\n아이콘으로 드래그하세요",
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
            element: const Text("About"),
            navigatePath: aboutPageRoute,
          ),
          AnimatedElement(
            width: widget.widgetHeight * 2,
            element: const Text("School"),
            navigatePath: schoolPageRoute,
          ),
          AnimatedElement(
            width: widget.widgetHeight * 2,
            element: const Text("Projects"),
            navigatePath: projectsPageRoute,
          ),
          AnimatedElement(
            width: widget.widgetHeight * 2,
            element: const Text("Award"),
            navigatePath: awardPageRoute,
          ),
          AnimatedElement(
            width: widget.widgetHeight * 2,
            element: const Text("Resume"),
            navigatePath: resumePageRoute,
          ),
        ],
      ),
    );
  }
}
