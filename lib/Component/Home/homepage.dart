import 'package:flutter/material.dart';
import 'package:portfolio/Component/nav_bar.dart';
import 'package:portfolio/router.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '서울로봇고 문인우의 포트폴리오',
      onGenerateRoute: Application.router.generator,
      home: Stack(
        children: [
          Material(
            color: Colors.amber,
            child: ListView(
              children: [for(int i = 0; i < 100; i++) Text("$i try")],
            ),
          ),
          const NavBar(),
        ],
      ),
    );
  }
}
