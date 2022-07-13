import 'package:flutter/material.dart';
import 'package:korea_regexp/korea_regexp.dart';
import 'package:portfolio/Component/Home/typing_bar.dart';

class IntroText extends StatefulWidget {
  const IntroText({Key? key}) : super(key: key);

  @override
  State<IntroText> createState() => _IntroTextState();
}

class _IntroTextState extends State<IntroText> {
  final TextStyle _textStyle = const TextStyle(
      fontSize: 64, color: Colors.lightBlue, fontFamily: "gothic");
  final List<String> _textList = [
    explode("포기하지 않는").join(),
    explode("다양한 경험을 쌓고싶은").join(),
    explode("미래의 소프트웨어 개발자").join(),
    explode("끊임없이 나아가는").join()
  ];
  String _nowText = '';
  int _target = 0;
  int _textIdx = 0;
  bool _increasing = true;
  int _delayTime = 3000;

  @override
  Widget build(BuildContext context) {
    updateText();
    return Container(
      constraints: const BoxConstraints(minHeight: 93),
      child: RichText(
        overflow: TextOverflow.fade,
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

  void updateText() async {
    await Future.delayed(Duration(milliseconds: _delayTime));
    setState(() {
      if (_increasing) {
        _delayTime = 90;
        if (++_textIdx > _textList[_target].length) {
          _delayTime = 2000;
          _increasing = false;
          _textIdx = _textList[_target].length;
        }
        _nowText = _textIdx != 0
            ? implode(_textList[_target].substring(0, _textIdx))
            : " ";
      } else {
        _delayTime = 75;
        if (_nowText == '') {
          _delayTime = 1000;
          _textIdx = 0;
          _increasing = true;
          if (++_target >= _textList.length) {
            _target = 0;
          }
        } else {
          _nowText = _nowText.substring(0, _nowText.length - 1);
        }
      }
    });
  }
}
