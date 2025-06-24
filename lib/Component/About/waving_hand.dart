import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

@immutable
class WavingHand extends StatefulWidget {
  const WavingHand({
    required this.color,
    required this.size,
    super.key,
  });

  final Color? color;
  final double? size;

  @override
  State<WavingHand> createState() => _WavingHandState();

  @override
  void debugFillProperties(final DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(ColorProperty('color', color))
      ..add(DoubleProperty('size', size));
  }
}

class _WavingHandState extends State<WavingHand>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _rotateAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    _rotateAnimation = Tween<double>(begin: -2 / 45, end: 2 / 45).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
    _rotateAnimation.addStatusListener((final AnimationStatus status) {
      if (status == AnimationStatus.completed) {
        _controller.reverse();
      } else if (status == AnimationStatus.dismissed) {
        _controller.forward();
      }
    });
    _controller.forward();
  }

  @override
  Widget build(final BuildContext context) => RotationTransition(
        turns: _rotateAnimation,
        child: Icon(
          Icons.waving_hand_rounded,
          color: widget.color,
          size: widget.size,
        ),
      );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
