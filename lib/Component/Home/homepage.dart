import 'package:flutter/material.dart';
import 'package:portfolio/Component/nav_bar.dart';
import 'package:portfolio/router.dart';
import 'package:portfolio/Component/Home/my_banner.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  static const TextStyle accent = TextStyle(color: Colors.lightBlue);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '서울로봇고 문인우의 포트폴리오',
      onGenerateRoute: Application.router.generator,
      home: Stack(
        children: [
          Material(
            child: Stack(
              children: [
                Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color.fromARGB(255, 19, 19, 50),
                        Color.fromARGB(255, 15, 14, 38),
                        Color.fromARGB(255, 12, 10, 26),
                      ],
                      stops: [0, 0.35, 0.7],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                ),
                ListView(
                  children: [
                    const Padding(
                      padding: EdgeInsetsDirectional.only(top: 96),
                      child: MyBanner(),
                    ),
                    SizedBox(
                      height: 600,
                      child: Padding(
                        padding: const EdgeInsets.all(100),
                        child: Center(
                          child: RichText(
                            softWrap: false,
                            text: const TextSpan(
                              style: TextStyle(
                                fontSize: 24,
                                color: Colors.white,
                              ),
                              children: [
                                TextSpan(
                                    text: "안녕하세요?\n\n",
                                    style: TextStyle(
                                        fontSize: 48, color: Colors.lightBlue)),
                                TextSpan(text: "저는 소프트웨어로 프로그램을 만드는 일을 좋아하고 그에 따라, 최소한은 알고 있다고 생각합니다\n\n"),
                                TextSpan(text: "저는 "),
                                TextSpan(text: "Python, C#", style: accent),
                                TextSpan(text: "과 같이 현대적인 언어에 비교적 익숙합니다\n\n"),
                                TextSpan(text: "저는 "),
                                TextSpan(text: "어플리케이션 제작, DBA, 게임", style: accent),
                                TextSpan(text: "등에 관심있으며\n"),
                                TextSpan(text: "웹 프론트엔드, 게임, 어플리케이션, 간단한 AI", style: accent),
                                TextSpan(text: "등을 만들어본 경험이 있습니다")
                              ],
                            ),
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
                              const TextSpan(
                                text: "FIND ME ON\n",
                                style: TextStyle(
                                    fontSize: 36, color: Colors.lightBlue),
                              ),
                              const WidgetSpan(child: Icon(Icons.call, color: Colors.white,)),
                              const TextSpan(text: " 010-9297-9467\n"),
                              const WidgetSpan(child: Icon(Icons.mail, color: Colors.white,)),
                              const TextSpan(text: " miw1102@naver.com\n"),
                              WidgetSpan(child: Image.asset("lib/Assets/Image/githubIcon.png",  height: 25,)),
                              const TextSpan(text: " https://github.com/modabada\n"),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const NavBar(widgetSize: 96),
        ],
      ),
    );
  }
}
