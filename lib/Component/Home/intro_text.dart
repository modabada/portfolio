import 'dart:async';
import 'package:flutter/material.dart';
import 'package:korea_regexp/korea_regexp.dart';
import 'package:portfolio/Component/Home/typing_bar.dart';

@immutable
class IntroText extends StatefulWidget {
  const IntroText({super.key});

  @override
  State<IntroText> createState() => _IntroTextState();
}

class _IntroTextState extends State<IntroText> {
  late final List<String> _textList;
  String _nowText = '';
  int _target = 0;
  int _textIdx = 0;
  bool _increasing = true;
  Timer? _textListener;

  @override
  void initState() {
    super.initState();
    _textList = <String>[
      List<String>.unmodifiable(explode('포기하지 않는')).join(),
      List<String>.unmodifiable(explode('다양한 경험을 쌓고싶은')).join(),
      List<String>.unmodifiable(explode('문제를 보면 해결하고 싶은')).join(),
      List<String>.unmodifiable(explode('미래의 소프트웨어 개발자')).join(),
      List<String>.unmodifiable(explode('버그와 함께 사는')).join(),
      List<String>.unmodifiable(explode('하루하루 발전하는')).join(),
    ];
    setListener(3000, isPaused: true);
  }

  @override
  Widget build(final BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    final TextTheme textTheme = Theme.of(context).textTheme;
    final TextStyle textStyle = textTheme.displayLarge!.copyWith(
      color: colorScheme.primary,
    );

    return Container(
      constraints: const BoxConstraints(minHeight: 93),
      child: RichText(
        maxLines: 2,
        textAlign: TextAlign.center,
        text: TextSpan(
          text: _nowText,
          style: textStyle,
          children: const <InlineSpan>[
            WidgetSpan(
              child: TypingBar(),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _textListener?.cancel();
    super.dispose();
  }

  void setListener(final int delayTime, {final bool isPaused = false}) {
    if (_textListener != null) {
      _textListener?.cancel();
    }
    if (isPaused) {
      _textListener = Timer(
        Duration(milliseconds: delayTime),
        () => setListener(_increasing ? 90 : 75),
      );
    } else {
      _textListener = Timer.periodic(
        Duration(milliseconds: delayTime),
        (final Timer timer) => updateText(),
      );
    }
  }

  void updateText() {
    if (!mounted) {
      return;
    }
    if (_increasing) {
      if (++_textIdx > _textList[_target].length) {
        _increasing = false;
        _textIdx--;
        setListener(2000, isPaused: true);
      }
      setState(() {
        _nowText = implode(_textList[_target].substring(0, _textIdx));
      });
    } else {
      if (_nowText == '') {
        _textIdx = 0;
        _increasing = true;
        if (++_target >= _textList.length) {
          _target = 0;
        }
        setListener(1000, isPaused: true);
      } else {
        setState(() {
          _nowText = _nowText.substring(0, _nowText.length - 1);
        });
      }
    }
  }
}
