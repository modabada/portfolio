import 'package:flutter/material.dart';
import 'package:portfolio/Component/default_template.dart';

@immutable
class AwardPage extends DefaultTemplate {
  const AwardPage({super.key});

  @override
  Widget body(final BuildContext context) => const Padding(
        padding: EdgeInsets.only(top: 100),
        child: Center(
          child: Text(
            'awardPage 제작중',
            style: TextStyle(fontSize: 76),
          ),
        ),
      );
}
