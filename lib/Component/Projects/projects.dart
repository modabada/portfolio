import 'package:flutter/material.dart';
import 'package:portfolio/Component/default_template.dart';

class ProjectsPage extends DefaultTemplate {
  const ProjectsPage({Key? key}) : super(key: key);

  @override
  Widget body(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(top: 100),
      child: Center(
        child: Text(
          "projectsPage 제작중",
          style: TextStyle(fontSize: 76),
        ),
      ),
    );
  }
}
