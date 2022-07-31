import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TechElement extends StatefulWidget {
  const TechElement({
    Key? key,
    required this.height,
    required this.fileName,
  }) : super(key: key);
  final double height;
  final String fileName;

  @override
  State<TechElement> createState() => _TechElementState();
}

class _TechElementState extends State<TechElement>
    with SingleTickerProviderStateMixin {
  late final SvgPicture svgPicture;
  late final AnimationController _controller;
  late final Animation<double> _borderAnimation;

  @override
  void initState() {
    super.initState();
    svgPicture = SvgPicture.asset(
      "lib/Assets/Tech_logo/${widget.fileName}.svg",
      width: (widget.height - 30) * 1.61,
      height: widget.height - 30,
    );
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 100),
    );
    _borderAnimation = Tween<double>(begin: 1, end: 10).animate(
      CurvedAnimation(parent: _controller, curve: Curves.linear),
    );
    _borderAnimation.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateColor.resolveWith(
          (states) => const Color(0x00000000),
        ),
        shadowColor: MaterialStateColor.resolveWith(
          (states) => const Color(0x00000000),
        ),
        overlayColor: MaterialStateColor.resolveWith(
          (states) => const Color(0x00000000),
        ),
      ),
      onPressed: () {},
      onHover: (isHover) => isHover
          ? _controller.forward(from: _controller.value)
          : _controller.reverse(from: _controller.value),
      child: Container(
        width: widget.height * 1.61,
        height: widget.height + _borderAnimation.value,
        decoration: BoxDecoration(
            border: Border.all(
              width: 1 + _borderAnimation.value * 0.5,
              color: Color.alphaBlend(
                  Colors.lightBlue.withAlpha(50),
                  Colors.lightBlue
                      .withAlpha((20 * _borderAnimation.value).round())),
            ),
            borderRadius: const BorderRadius.all(Radius.circular(15))),
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 25),
              child: svgPicture,
            ),
            Text(widget.fileName.substring(0, widget.fileName.length - 5)),
          ],
        ),
      ),
    );
  }
}
