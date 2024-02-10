import 'package:flutter/material.dart';
import 'package:portfolio/router.dart';

class AnimatedElement extends StatefulWidget {
  const AnimatedElement(
      {Key? key,
      required this.width,
      required this.navigatePath,
      this.element,
      this.customElement})
      : super(key: key);
  final double width;
  final String navigatePath;
  final Widget? element;
  final Widget? customElement;

  @override
  State<AnimatedElement> createState() => AnimatedElementState();
}

class AnimatedElementState extends State<AnimatedElement>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _widthAnimation;
  Color _widgetColor = Colors.transparent;

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
    final colorScheme = Theme.of(context).colorScheme;

    return DragTarget<int>(
      builder: (BuildContext context, List<dynamic> candidateData,
          List<dynamic> rejectedData) {
        return Container(
          decoration: BoxDecoration(
            border: Border.all(width: 5, color: _widgetColor),
            borderRadius: const BorderRadius.all(Radius.circular(15)),
          ),
          child: Stack(
            alignment: Alignment.bottomLeft,
            children: [
              widget.customElement ??
                  SizedBox(
                    width: widget.width,
                    height: widget.width / 2,
                    child: Center(child: widget.element),
                  ),
              Container(
                decoration: BoxDecoration(
                    color: colorScheme.secondary,
                    borderRadius:const  BorderRadius.all(Radius.elliptical(5, 5))),
                height: 5,
                width: _widthAnimation.value,
              ),
            ],
          ),
        );
      },
      onWillAccept: (data) {
        _widgetColor = colorScheme.onSecondary;
        _controller.forward();
        return true;
      },
      onAccept: (data) {
        _widgetColor = Colors.transparent;
        Application.router.navigateTo(context, widget.navigatePath);
      },
      onLeave: (data) {
        _widgetColor = Colors.transparent;
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
