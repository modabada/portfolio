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
  late final SvgPicture svgPicture = SvgPicture.asset(
    "lib/Assets/Tech_logo/${widget.fileName}.svg",
    width: (widget.height - 30) * 1.61,
    height: widget.height - 30,
  );
  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 100),
  );

  late final Animation<double> _borderAnimation =
      Tween<double>(begin: 1, end: 10).animate(
    CurvedAnimation(parent: _controller, curve: Curves.linear),
  );

  @override
  void initState() {
    super.initState();
    _borderAnimation.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateColor.resolveWith(
          (states) => Colors.transparent,
        ),
        shadowColor: MaterialStateColor.resolveWith(
          (states) => Colors.transparent,
        ),
        overlayColor: MaterialStateColor.resolveWith(
          (states) => Colors.transparent,
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
                colorScheme.primary.withAlpha(50),
                colorScheme.primary
                    .withAlpha((20 * _borderAnimation.value).round()),
              ),
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
