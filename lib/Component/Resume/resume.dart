import 'package:flutter/material.dart';
import 'package:portfolio/Component/default_template.dart';

class ResumePage extends DefaultTemplate {
  const ResumePage({Key? key}) : super(key: key);

  @override
  Widget body(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(top: 100),
      child: Center(
        child: Text(
          "resumePage 제작중",
          style: TextStyle(fontSize: 76),
        ),
      ),
    );
  }
}
