import 'package:flutter/material.dart';
import 'package:portfolio/Component/Home/my_banner.dart';
import 'package:portfolio/Component/default_template.dart';

class HomePage extends DefaultTemplate {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget body(BuildContext context) {
    return ListView(
      children: [
        const MyBanner(),
        const SizedBox(
          height: 600,
          child: Center(
            child: Text.rich(
              TextSpan(
                children: [
                  TextSpan(text: "안녕하세요?\n", style: largeAccent),
                  TextSpan(text: "저는 소프트웨어로 프로그램을 만드는 일을 좋아하고 그에 따라, "),
                  TextSpan(text: "최소한은 알고있다고 생각합니다\n\n", style: accent),
                  TextSpan(text: "저는 "),
                  TextSpan(text: "Python, C#", style: accent),
                  TextSpan(text: "과 같이 현대적인 언어에 비교적 익숙합니다\n\n"),
                  TextSpan(text: "저는 "),
                  TextSpan(text: "어플리케이션 제작, DBA, 백엔드, 게임", style: accent),
                  TextSpan(text: "등에 관십있으며\n"),
                  TextSpan(
                    text: "웹 프론트엔드, 게임, 어플리케이션, 간단한 AI, 제어시스템",
                    style: accent,
                  ),
                  TextSpan(text: "등을 만들어본 경험이 있습니다"),
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(50),
          child: Center(
            child: Text.rich(
              style: small,
              softWrap: false,
              TextSpan(
                children: [
                  TextSpan(text: "FIND ME ON\n", style: medium.merge(accent)),
                  WidgetSpan(
                    child: Icon(
                      Icons.call,
                      color: textStyle.color,
                    ),
                  ),
                  const TextSpan(text: " 010-9297-9467\n"),
                  WidgetSpan(
                    child: Icon(
                      Icons.mail,
                      color: textStyle.color,
                    ),
                  ),
                  const TextSpan(text: " miw1102@naver.com\n"),
                  WidgetSpan(
                    child: Image.asset(
                      "lib/Assets/Image/githubIcon.png",
                      height: textStyle.fontSize,
                      color: textStyle.color,
                    ),
                  ),
                  const TextSpan(text: " https://github.com/modabada"),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
