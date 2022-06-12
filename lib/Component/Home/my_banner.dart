import 'package:flutter/material.dart';
import 'package:korea_regexp/korea_regexp.dart';

class MyBanner extends StatelessWidget {
  const MyBanner({Key? key}) : super(key: key);
  static final Image _photo = Image.asset(
    "lib/Assets/Image/IDPhoto.png",
    height: 500,
    colorBlendMode: BlendMode.clear,
  );
  final TextStyle _textStyle =
      const TextStyle(fontSize: 48, color: Colors.white);

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Container(
      height: 800,
      color: const Color.fromARGB(50, 0, 0, 0),
      child: Stack(
        children: [
          Image.asset(
            "lib/Assets/Image/banner_back.png",
            height: 800,
            width: screenSize.width,
            fit: BoxFit.cover,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "안녕하세요, 저는",
                      style: _textStyle,
                      overflow: TextOverflow.clip,
                      softWrap: false,
                    ),
                    const IntroText(),
                    Text(
                      "문인우 입니다",
                      style: _textStyle,
                      overflow: TextOverflow.clip,
                      softWrap: false,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  right: 200,
                ),
                child: _photo,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class IntroText extends StatefulWidget {
  const IntroText({Key? key}) : super(key: key);

  @override
  State<IntroText> createState() => _IntroTextState();
}

class _IntroTextState extends State<IntroText> {
  final TextStyle _textStyle =
      const TextStyle(fontSize: 64, color: Colors.lightBlue);
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
    return SizedBox(
      height: 85,
      child: Wrap(
        clipBehavior: Clip.hardEdge,
        children: [
          Text(_nowText,
              overflow: TextOverflow.clip, softWrap: false, style: _textStyle),
          const TypingBar(),
        ],
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

class TypingBar extends StatefulWidget {
  const TypingBar({Key? key}) : super(key: key);

  @override
  State<TypingBar> createState() => _TypingBarState();
}

class _TypingBarState extends State<TypingBar>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _colorAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 750),
    );

    _colorAnimation = Tween<double>(begin: 255, end: -50).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeIn),
    );

    _colorAnimation.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    _controller.repeat();
    return Container(
      width: 4,
      height: 100,
      color: Color.fromARGB(_colorAnimation.value.round(), 3, 169, 244),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
