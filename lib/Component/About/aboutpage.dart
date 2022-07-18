import 'package:flutter/material.dart';
import 'package:portfolio/Component/nav_bar.dart';
import 'package:portfolio/Component/background.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Stack(
        children: [
          const Background(),
          ListView(
            children: const [
              Padding(
                padding: EdgeInsets.only(top: 96),
                child: Text(
                  "About page 제작중",
                  style: TextStyle(fontSize: 76, color: Colors.white),
                ),
              )
            ],
          ),
          const NavBar(),
        ],
      ),
    );
  }
}
