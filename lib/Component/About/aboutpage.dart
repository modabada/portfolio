import 'package:flutter/material.dart';
import 'package:portfolio/router.dart';
import 'package:portfolio/Component/nav_bar.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({Key? key}) : super(key: key);

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
                  children: const [
                    Padding(
                      padding: EdgeInsets.only(top: 96),
                      child: Text(
                        "About page 제작중",
                        style:
                            TextStyle(fontSize: 76, color: Colors.white),
                      ),
                    )
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
