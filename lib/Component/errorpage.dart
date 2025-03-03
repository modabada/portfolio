import 'package:flutter/material.dart';
import 'package:portfolio/Component/background.dart';

@immutable
class ErrorPage extends StatelessWidget {
  const ErrorPage({super.key});

  static const TextStyle _colorHighlight = TextStyle(color: Colors.lightBlue);
  static const TextStyle _largeText = TextStyle(fontSize: 56);

  @override
  Widget build(final BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return Material(
      textStyle: const TextStyle(fontSize: 36, color: Colors.white, height: 2),
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          const Background(),
          ListView(
            padding: EdgeInsets.symmetric(vertical: screenSize.height * 0.3),
            children: <Widget>[
              const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text.rich(
                    TextSpan(
                      style: _largeText,
                      children: <InlineSpan>[
                        TextSpan(text: 'We detected '),
                        TextSpan(
                          text: 'something wrong ',
                          style: _colorHighlight,
                        ),
                        TextSpan(text: 'when loading.'),
                      ],
                    ),
                  ),
                  Text('Please try again a few minute late'),
                  Text('If you keep watching this page, it will be my fault'),
                  Text(
                    "I'll be my best to make a more awesome page",
                    style: _colorHighlight,
                  ),
                ],
              ),
              SizedBox(height: screenSize.height * 0.1),
              const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text.rich(
                    TextSpan(
                      style: _largeText,
                      children: <InlineSpan>[
                        TextSpan(text: '로딩중 '),
                        TextSpan(
                          text: '오류가 발생',
                          style: _colorHighlight,
                        ),
                        TextSpan(text: '했습니다.'),
                      ],
                    ),
                  ),
                  Text('잠시 뒤 다시 시도해주세요'),
                  Text('만약 계속 해당 페이지가 표시된다면, 아마도 제가 잘못 만든거겠죠'),
                  Text(
                    '더 나은 페이지를 만들기 위해 항상 노력하겠습니다',
                    style: _colorHighlight,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
