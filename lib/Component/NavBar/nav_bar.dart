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
  late final Map<String, Widget> images;

  @override
  void initState() {
    super.initState();
    images = {
      "locator": Icon(
        Icons.location_on,
        size: widget.widgetHeight,
        color: Colors.lightBlue,
      ),
      "locator_drag": Icon(
        Icons.location_on_outlined,
        size: widget.widgetHeight,
        color: const Color.fromARGB(50, 255, 255, 255),
      ),
      "home": Icon(
        Icons.home_rounded,
        size: widget.widgetHeight,
        color: const Color.fromARGB(255, 50, 50, 200),
      )
    };
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: const Color.fromARGB(100, 0, 0, 0),
      textStyle: const TextStyle(fontSize: 24, color: Colors.white),
      child: Wrap(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
          ),
          Draggable<int>(
            data: 0,
            childWhenDragging: SizedBox(
              width: widget.widgetHeight,
              child: images["locator_drag"],
            ),
            feedback: SizedBox(
              width: widget.widgetHeight,
              child: images["locator"],
            ),
            child: SizedBox(
              width: widget.widgetHeight,
              child: images["locator"],
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
            customElement: images["home"],
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
