import 'package:flutter/material.dart';
import 'package:portfolio/router.dart';

class Images {
  void load() {
    locator = Image.asset("lib/Assets/Image/Home.png");
    locatorWhenDrag = Image.asset(
      "lib/Assets/Image/Home.png",
      color: const Color.fromARGB(50, 0, 0, 0),
    );
    home = Image.asset("lib/Assets/Image/Home.png", color: Colors.black);
  }

  late Image locator;
  late Image locatorWhenDrag;
  late Image home;
}

class NavBar extends StatefulWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  State<NavBar> createState() => NavBarState();
}

class NavBarState extends State<NavBar> {
  late Images images;

  @override
  void initState() {
    super.initState();
    images = Images();
    images.load();
  }

  @override
  Widget build(BuildContext context) {
    double widgetHeight = MediaQuery.of(context).size.height * 0.1;

    return Material(
      color: const Color.fromARGB(50, 0, 0, 0),
      textStyle: const TextStyle(fontSize: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Draggable<int>(
            data: 0,
            childWhenDragging: SizedBox(
              width: widgetHeight,
              height: widgetHeight,
              child: images.locatorWhenDrag,
            ),
            feedback: SizedBox(
              width: widgetHeight,
              height: widgetHeight,
              child: images.locator,
            ),
            child: SizedBox(
              width: widgetHeight,
              height: widgetHeight,
              child: images.locator,
            ),
          ),
          const Expanded(
            child: SizedBox(),
          ),
          const Text("왼쪽 아이콘을 이동하고싶은 아이콘으로 드래그하세요"),
          const Expanded(
            child: SizedBox(),
          ),
          AnimatedElement(
            width: widgetHeight,
            element: SizedBox(
              width: widgetHeight,
              height: widgetHeight,
              child: images.home,
            ),
            customElement: SizedBox(
              width: widgetHeight,
              height: widgetHeight,
              child: images.home,
            ),
            navigatePath: homePageRoute,
          ),
          AnimatedElement(
            width: widgetHeight * 2,
            element: const Text("About"),
            navigatePath: homePageRoute,
          ),
          AnimatedElement(
            width: widgetHeight * 2,
            element: const Text("What i did"),
            navigatePath: homePageRoute,
          ),
          AnimatedElement(
            width: widgetHeight * 2,
            element: const Text("Projects"),
            navigatePath: homePageRoute,
          ),
          AnimatedElement(
            width: widgetHeight * 2,
            element: const Text("Award"),
            navigatePath: homePageRoute,
          ),
          AnimatedElement(
            width: widgetHeight * 2,
            element: const Text("Resume"),
            navigatePath: homePageRoute,
          ),
        ],
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
  late AnimationController _controller;
  late Animation<double> _widthAnimation;
  Color widgetColor = const Color.fromARGB(0, 0, 0, 0);

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );

    _widthAnimation = Tween<double>(begin: 0, end: widget.width).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeIn),
    );

    _widthAnimation.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return DragTarget<int>(
      builder: (BuildContext context, List<dynamic> candidateData,
          List<dynamic> rejectedData) {
        return Container(
          color: widgetColor,
          child: Padding(
            // padding: widgetPadding.copyWith(top: 0, bottom: 0),
            padding: const EdgeInsets.only(left: 10, right: 10),
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
          ),
        );
      },
      onWillAccept: (data) {
        widgetColor = const Color.fromARGB(50, 0, 0, 0);
        _controller.forward();
        return true;
      },
      onAccept: (data) {
        widgetColor = const Color.fromARGB(0, 0, 0, 0);
        Application.router.navigateTo(context, widget.navigatePath);
      },
      onLeave: (data) {
        widgetColor = const Color.fromARGB(0, 0, 0, 0);
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
