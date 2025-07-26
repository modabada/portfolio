import 'package:flutter/material.dart';
import 'package:portfolio/Component/default_template.dart';

@immutable
class SchoolPage extends DefaultTemplate {
  const SchoolPage({super.key});

  @override
  Widget body(final BuildContext context) => const Padding(
        padding: EdgeInsets.only(top: 96, bottom: 48),
        child: Center(
          child: Text(
            'schoolPage 제작중',
            style: TextStyle(fontSize: 76),
          ),
        ),
      );
}
