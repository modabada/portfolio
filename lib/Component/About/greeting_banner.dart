import 'package:flutter/material.dart';
import 'package:portfolio/Component/About/waving_hand.dart';

class GreetingBanner extends StatelessWidget {
  const GreetingBanner({Key? key}) : super(key: key);
  static const TextStyle _small = TextStyle(fontSize: 18);
  static const TextStyle _bannerStyle = TextStyle(fontSize: 24);
  static const TextStyle _accent = TextStyle(color: Colors.lightBlue);
  static const TextStyle _largeAccent = TextStyle(
    fontSize: 48,
    color: Colors.lightBlue,
  );
  static const WidgetSpan arrow = WidgetSpan(
    child: Padding(
      padding: EdgeInsets.only(left: 24, right: 12),
      child: Icon(
        Icons.double_arrow_rounded,
        color: Colors.white,
        size: 24,
      ),
    ),
  );

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.only(top: 200),
      height: 576,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(
            width: screenSize.width * 0.52,
            child: const Text.rich(
              TextSpan(
                style: _bannerStyle,
                children: [
                  TextSpan(text: "제가 누구냐면요\n\n", style: _largeAccent),
                  TextSpan(text: "안녕하세요, 저는 서울로봇고등학교에서 첨단로봇 제어과를 전공한 "),
                  TextSpan(text: "문인우 ", style: _accent),
                  TextSpan(text: "입니다\n\n"),
                  TextSpan(text: "코딩 외에도 제가 즐겨 하는 것들은\n"),
                  arrow,
                  TextSpan(text: "컴퓨터게임\n"),
                  arrow,
                  TextSpan(text: "농구\n"),
                  arrow,
                  TextSpan(text: "(코딩이나 센서 원리 등의)", style: _small),
                  TextSpan(text: "기타 정보 검색\n"),
                  TextSpan(text: "등이 있습니다"),
                ],
              ),
            ),
          ),
          WavingHand(color: Colors.white, size: screenSize.width * 0.234375),
        ],
      ),
    );
  }
}
