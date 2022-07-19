import 'package:flutter/material.dart';
import 'package:portfolio/Component/background.dart';

class LoadingPage extends StatelessWidget {
  const LoadingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      textStyle: const TextStyle(fontSize: 72, color: Colors.white),
      child: Stack(
        alignment: Alignment.center,
        children: [
          const Background(),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text("Loading..."),
              SizedBox(
                width: 100,
                height: 100,
                child: CircularProgressIndicator(strokeWidth: 5),
              ),
            ],
          )
        ],
      ),
    );
  }
}
