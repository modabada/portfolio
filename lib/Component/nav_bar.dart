import 'package:flutter/material.dart';
import 'package:portfolio/router.dart';

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
      child: Container(
        height: widget.widgetHeight * 2 + 20,
        alignment: Alignment.topLeft,
        child: RichText(
          overflow: TextOverflow.visible,
          maxLines: 2,
          text: TextSpan(
            children: [
              WidgetSpan(
                child: Draggable<int>(
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
              ),
              WidgetSpan(
                alignment: PlaceholderAlignment.bottom,
                child: SizedBox(
                  width: widget.widgetHeight * 4,
                  child: const Text(
                    "왼쪽 아이콘을 이동하고싶은\n아이콘으로 드래그하세요",
                    textAlign: TextAlign.center,
                    softWrap: false,
                  ),
                ),
              ),
              WidgetSpan(
                child: AnimatedElement(
                  width: widget.widgetHeight,
                  element: SizedBox(
                    child: images["home"],
                  ),
                  customElement: SizedBox(
                    child: images["home"],
                  ),
                  navigatePath: homePageRoute,
                ),
              ),
              WidgetSpan(
                child: AnimatedElement(
                  width: widget.widgetHeight * 2,
                  element: const Text("About"),
                  navigatePath: aboutPageRoute,
                ),
              ),
              WidgetSpan(
                child: AnimatedElement(
                  width: widget.widgetHeight * 2,
                  element: const Text("School"),
                  navigatePath: schoolPageRoute,
                ),
              ),
              WidgetSpan(
                child: AnimatedElement(
                  width: widget.widgetHeight * 2,
                  element: const Text("Projects"),
                  navigatePath: homePageRoute,
                ),
              ),
              WidgetSpan(
                child: AnimatedElement(
                  width: widget.widgetHeight * 2,
                  element: const Text("Award"),
                  navigatePath: homePageRoute,
                ),
              ),
              WidgetSpan(
                child: AnimatedElement(
                  width: widget.widgetHeight * 2,
                  element: const Text("Resume"),
                  navigatePath: homePageRoute,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AnimatedElement extends StatefulWidget {
  const AnimatedElement(
      {Key? key,
      required this.width,
      required this.element,
      required this.navigatePath,
      this.customElement})
      : super(key: key);
  final double width;
  final Widget element;
  final String navigatePath;
  final Widget? customElement;

  @override
  State<AnimatedElement> createState() => AnimatedElementState();
}

class AnimatedElementState extends State<AnimatedElement>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _widthAnimation;
  Color _widgetColor = const Color.fromARGB(0, 0, 0, 0);

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );

    _widthAnimation = Tween<double>(begin: 0, end: widget.width).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeIn),
    );

    _widthAnimation.addListener(() => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return DragTarget<int>(
      builder: (BuildContext context, List<dynamic> candidateData,
          List<dynamic> rejectedData) {
        return Container(
          decoration: BoxDecoration(
            border: Border.all(width: 5, color: _widgetColor),
            borderRadius: const BorderRadius.all(Radius.elliptical(15, 15)),
          ),
          child: Stack(
            alignment: Alignment.bottomLeft,
            children: [
              widget.customElement ??
                  Container(
                    width: widget.width,
                    height: widget.width / 2,
                    alignment: Alignment.bottomLeft,
                    child: Center(child: widget.element),
                  ),
              Container(
                decoration: const BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.all(Radius.elliptical(5, 5))),
                height: 5,
                width: _widthAnimation.value,
              ),
            ],
          ),
        );
      },
      onWillAccept: (data) {
        _widgetColor = const Color.fromARGB(50, 255, 255, 255);
        _controller.forward();
        return true;
      },
      onAccept: (data) {
        _widgetColor = const Color.fromARGB(0, 0, 0, 0);
        Application.router.navigateTo(context, widget.navigatePath);
      },
      onLeave: (data) {
        _widgetColor = const Color.fromARGB(0, 0, 0, 0);
        _controller.reverse();
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
