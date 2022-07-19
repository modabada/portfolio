import 'dart:async';
import 'package:flutter/material.dart';
import 'package:korea_regexp/korea_regexp.dart';
import 'package:portfolio/Component/Home/typing_bar.dart';

class IntroText extends StatefulWidget {
  const IntroText({Key? key}) : super(key: key);

  @override
  State<IntroText> createState() => _IntroTextState();
}

class _IntroTextState extends State<IntroText> {
  late final TextStyle _textStyle;
  late final List<String> _textList;
  String _nowText = '';
  int _target = 0;
  int _textIdx = 0;
  bool _increasing = true;
  Timer? _textListener;

  @override
  void initState() {
    super.initState();
    _textStyle = const TextStyle(fontSize: 64, color: Colors.lightBlue);
    _textList = [
      explode("포기하지 않는").join(),
      explode("다양한 경험을 쌓고싶은").join(),
      explode("미래의 소프트웨어 개발자").join(),
      explode("하루하루 발전하는").join()
    ];
    setListener(3000, isPaused: true);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(minHeight: 93),
      child: RichText(
        overflow: TextOverflow.clip,
        maxLines: 2,
        text: TextSpan(
          text: _nowText,
          style: _textStyle,
          children: const [
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

  void setListener(int delayTime, {bool isPaused = false}) {
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
        (timer) => updateText(),
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
