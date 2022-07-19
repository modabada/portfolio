import 'package:flutter/material.dart';
import 'package:portfolio/Component/nav_bar.dart';
import 'package:portfolio/Component/Home/my_banner.dart';
import 'package:portfolio/Component/background.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  static const TextStyle _accent = TextStyle(
    color: Colors.lightBlue,
  );
  static const TextStyle _largeAccent = TextStyle(
    fontSize: 48,
    color: Colors.lightBlue,
  );

  @override
  Widget build(BuildContext context) {
    return Material(
      textStyle: const TextStyle(fontSize: 24, color: Colors.white),
      child: Stack(
        children: [
          const Background(),
          ListView(
            children: [
              const MyBanner(),
              const SizedBox(
                height: 600,
                child: Center(
                  child: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(text: "안녕하세요?\n", style: _largeAccent),
                        TextSpan(text: "저는 소프트웨어로 프로그램을 만드는 일을 좋아하고 그에 따라, "),
                        TextSpan(text: "최소한은 알고있다고 생각합니다\n\n", style: _accent),
                        TextSpan(text: "저는 "),
                        TextSpan(text: "Python, C#", style: _accent),
                        TextSpan(text: "과 같이 현대적인 언어에 비교적 익숙합니다\n\n"),
                        TextSpan(text: "저는 "),
                        TextSpan(
                          text: "어플리케이션 제작, DBA, 백엔드, 게임",
                          style: _accent,
                        ),
                        TextSpan(text: "등에 관심있으며\n"),
                        TextSpan(
                          text: "웹 프론트엔드, 게임, 어플리케이션, 간단한 AI",
                          style: _accent,
                        ),
                        TextSpan(text: "등을 만들어본 경험이 있습니다")
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(50),
                child: Center(
                  child: RichText(
                    softWrap: false,
                    text: TextSpan(
                      style: const TextStyle(fontSize: 16, color: Colors.white),
                      children: [
                        TextSpan(
                          text: "FIND ME ON\n",
                          style: TextStyle(fontSize: 36, color: _accent.color),
                        ),
                        const WidgetSpan(
                          child: Icon(
                            Icons.call,
                            color: Colors.white,
                          ),
                        ),
                        const TextSpan(text: " 010-9297-9467\n"),
                        const WidgetSpan(
                          child: Icon(
                            Icons.mail,
                            color: Colors.white,
                          ),
                        ),
                        const TextSpan(text: " miw1102@naver.com\n"),
                        WidgetSpan(
                          child: Image.asset(
                            "lib/Assets/Image/githubIcon.png",
                            height: 25,
                          ),
                        ),
                        const TextSpan(text: " https://github.com/modabada\n"),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          const NavBar(),
        ],
      ),
    );
  }
}
