import 'package:flutter/material.dart';
import 'package:portfolio/router.dart';

const widgetPadding = EdgeInsets.all(10);

class NavBar extends StatefulWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  State<NavBar> createState() => NavBarState();
}

class NavBarState extends State<NavBar> {
  @override
  Widget build(BuildContext context) {
    double widgetHeight = MediaQuery.of(context).size.height * 0.1;

    return Material(
      color: const Color.fromARGB(50, 0, 0, 0),
      textStyle: const TextStyle(fontSize: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          AnimatedElement(
            width: widgetHeight,
            element: Image.asset(
              "lib/Assets/Image/Home.png",
              color: Colors.black,
              width: widgetHeight,
            ),
            navigatePath: homePageRoute,
          ),
          Draggable<int>(
            data: 0,
            childWhenDragging: Image.asset(
              "lib/Assets/Image/Home.png",
              width: widgetHeight,
              height: widgetHeight,
              color: const Color.fromARGB(50, 0, 0, 0),
            ),
            feedback: Image.asset(
              "lib/Assets/Image/Home.png",
              width: widgetHeight,
              height: widgetHeight,
            ),
            child: Image.asset(
              "lib/Assets/Image/Home.png",
              width: widgetHeight,
              height: widgetHeight,
            ),
          ),
          Expanded(
            child: AnimatedElement(
              width: widgetHeight,
              element: Container(
                height: widgetHeight,
                alignment: Alignment.bottomLeft,
                child: Center(child: Text("school")),
              ),
              navigatePath: homePageRoute,
            ),
          ),Expanded(
            child: AnimatedElement(
              width: widgetHeight,
              element: Container(
                height: widgetHeight,
                alignment: Alignment.bottomLeft,
                child: Center(child: Text("school")),
              ),
              navigatePath: homePageRoute,
            ),
          ),Expanded(
            child: AnimatedElement(
              width: widgetHeight,
              element: Container(
                height: widgetHeight,
                alignment: Alignment.bottomLeft,
                child: Center(child: Text("school")),
              ),
              navigatePath: homePageRoute,
            ),
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
      required this.navigatePath})
      : super(key: key);
  final double width;
  final Widget element;
  final String navigatePath;

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
      print(true);
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
            padding: widgetPadding.copyWith(top: 0, bottom: 0),
            child: Stack(
              alignment: Alignment.bottomLeft,
              children: [
                widget.element,
                Container(
                  decoration: const BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.all(Radius.elliptical(5, 5))),
                  height: 5,
                  width: _widthAnimation.value,
                )
              ],
            ),
          ),
        );
      },
      onWillAccept: (a) {
        widgetColor = const Color.fromARGB(50, 0, 0, 0);
        _controller.forward();
        return true;
      },
      onAccept: (a) {
        widgetColor = const Color.fromARGB(0, 0, 0, 0);
        Application.router.navigateTo(context, widget.navigatePath);
      },
      onLeave: (a) {
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
