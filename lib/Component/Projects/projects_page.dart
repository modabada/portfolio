import 'package:flutter/material.dart';
import 'package:portfolio/Component/default_template.dart';

@immutable
class ProjectsPage extends DefaultTemplate {
  const ProjectsPage({super.key});

  @override
  Widget body(final BuildContext context) => const Padding(
        padding: EdgeInsets.only(top: 100),
        child: Center(
          child: Text(
            'projectsPage 제작중',
            style: TextStyle(fontSize: 76),
          ),
        ),
      );
}
