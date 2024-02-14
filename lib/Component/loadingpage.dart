import 'package:flutter/material.dart';
import 'package:portfolio/Component/background.dart';

class LoadingPage extends StatelessWidget {
  const LoadingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Material(
      textStyle: TextStyle(fontSize: 72, color: Colors.white),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Background(),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
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
