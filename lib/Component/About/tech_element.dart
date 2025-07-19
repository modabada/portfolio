import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/gestures/events.dart';
import 'package:flutter_svg/flutter_svg.dart';

@immutable
class TechElement extends StatefulWidget {
  const TechElement({
    required this.height,
    required this.fileName,
    super.key,
  });

  final double height;

  final String fileName;

  @override
  State<TechElement> createState() => _TechElementState();

  @override
  void debugFillProperties(final DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DoubleProperty('height', height))
      ..add(StringProperty('fileName', fileName));
  }
}

class _TechElementState extends State<TechElement>
    with SingleTickerProviderStateMixin {
  late final SvgPicture svgPicture = SvgPicture.asset(
    'lib/Assets/Tech_logo/${widget.fileName}.svg',
    width: (widget.height - 32) * 1.6,
    height: widget.height - 32,
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
  Widget build(final BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;

    return MouseRegion(
      onEnter: (final PointerEnterEvent event) =>
          _controller.forward(from: _controller.value),
      onExit: (final PointerExitEvent event) =>
          _controller.reverse(from: _controller.value),
      child: Container(
        width: widget.height * 1.6,
        height: widget.height,
        decoration: BoxDecoration(
          border: Border.all(
            width: 1 + _borderAnimation.value * 0.4,
            color: colorScheme.primary.withAlpha(
              96 + (_borderAnimation.value * 25.5 - 96).round(),
            ),
          ),
          borderRadius: const BorderRadius.all(Radius.circular(15)),
        ),
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: <Widget>[
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: colorScheme.onPrimaryContainer.withAlpha(32),
                  borderRadius: BorderRadius.circular(widget.height),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 24),
              child: svgPicture,
            ),
            Text(widget.fileName.substring(0, widget.fileName.length - 5)),
          ],
        ),
      ),
    );
  }
}
