import 'package:flutter/material.dart';
import 'package:portfolio/Component/background.dart';

class MobilePage extends StatelessWidget {
  const MobilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      textStyle: const TextStyle(fontSize: 24, color: Colors.white, height: 2),
      child: Stack(
        alignment: Alignment.center,
        children: [
          const Background(),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text("mobile platform is not ready..."),
              Text("모바일 환경은 아직"),
              Text("준비되지 않았습니다..."),
            ],
          )
        ],
      ),
    );
  }
}
