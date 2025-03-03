import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/router.dart';

@immutable
class AnimatedElement extends StatefulWidget {
  const AnimatedElement({
    required this.width,
    required this.navigatePath,
    super.key,
    this.element,
    this.customElement,
  });

  final double width;
  final String navigatePath;
  final Widget? element;
  final Widget? customElement;

  @override
  State<AnimatedElement> createState() => _AnimatedElementState();

  @override
  void debugFillProperties(final DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DoubleProperty('width', width))
      ..add(StringProperty('navigatePath', navigatePath));
  }
}

class _AnimatedElementState extends State<AnimatedElement>
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
  Widget build(final BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;

    return DragTarget<int>(
      builder: (
        final BuildContext context,
        final List<dynamic> candidateData,
        final List<dynamic> rejectedData,
      ) =>
          DecoratedBox(
        decoration: BoxDecoration(
          border: Border.all(width: 5, color: _widgetColor),
          borderRadius: const BorderRadius.all(Radius.circular(15)),
        ),
        child: Stack(
          alignment: Alignment.bottomLeft,
          children: <Widget>[
            widget.customElement ??
                SizedBox(
                  width: widget.width,
                  height: widget.width / 2,
                  child: Center(child: widget.element),
                ),
            Container(
              decoration: BoxDecoration(
                color: colorScheme.secondary,
                borderRadius: const BorderRadius.all(Radius.elliptical(5, 5)),
              ),
              height: 5,
              width: _widthAnimation.value,
            ),
          ],
        ),
      ),
      onWillAccept: (final int? data) {
        _widgetColor = colorScheme.onSecondary;
        _controller.forward();
        return true;
      },
      onAccept: (final int data) {
        _widgetColor = Colors.transparent;
        unawaited(Application.router.navigateTo(context, widget.navigatePath));
      },
      onLeave: (final int? data) {
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
