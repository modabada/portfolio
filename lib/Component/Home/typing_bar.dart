import 'package:flutter/material.dart';

class TypingBar extends StatefulWidget {
  const TypingBar({Key? key}) : super(key: key);

  @override
  State<TypingBar> createState() => _TypingBarState();
}

class _TypingBarState extends State<TypingBar>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _colorAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 750),
    );

    _colorAnimation = Tween<double>(begin: 255, end: 0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeIn),
    );

    _colorAnimation.addListener(() {
      setState(() {});
    });
    _controller.repeat();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 4,
      height: 90,
      color: Colors.lightBlue.withAlpha(_colorAnimation.value.round() + 0),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
