import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/router.dart';

@immutable
class NavBarRouteButton extends StatefulWidget {
  const NavBarRouteButton({
    required this.navigatePath,
    required this.element,
    super.key,
  });

  final String navigatePath;
  final Widget element;

  @override
  State<NavBarRouteButton> createState() => _NavBarRouteButtonState();

  @override
  void debugFillProperties(final DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(StringProperty('navigatePath', navigatePath));
  }
}

class _NavBarRouteButtonState extends State<NavBarRouteButton>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _widthAnimation;
  Color _widgetColor = Colors.transparent;
  double? _widgetWidth;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );

    _widthAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeIn),
    );

    _widthAnimation.addListener(() => setState(() {}));

    WidgetsBinding.instance.addPersistentFrameCallback(
      (final Duration duration) {
        if (mounted) {
          _widgetWidth = context.size!.width;
        }
      },
    );
  }

  @override
  Widget build(final BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;

    return DecoratedBox(
      decoration: BoxDecoration(
        border: Border.all(width: 4, color: _widgetColor),
        borderRadius: const BorderRadius.all(Radius.circular(16)),
      ),
      child: Stack(
        alignment: Alignment.bottomLeft,
        children: <Widget>[
          GestureDetector(
            onTap: () => unawaited(
              Application.router.navigateTo(context, widget.navigatePath),
            ),
            child: MouseRegion(
              onEnter: (final PointerEnterEvent event) {
                _widgetColor = colorScheme.onSecondary;
                _controller.forward();
              },
              onExit: (final PointerExitEvent event) {
                _widgetColor = Colors.transparent;
                _controller.reverse();
              },
              cursor: SystemMouseCursors.click,
              child: Center(child: widget.element),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: colorScheme.secondary,
              borderRadius: const BorderRadius.all(Radius.elliptical(5, 5)),
            ),
            height: 5,
            width: _widthAnimation.value * (_widgetWidth ?? 0),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
