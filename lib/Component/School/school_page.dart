import 'package:flutter/material.dart';
import 'package:portfolio/Component/School/project_image_slider.dart';
import 'package:portfolio/Component/School/school_page_banner.dart';
import 'package:portfolio/Component/default_template.dart';

@immutable
class SchoolPage extends DefaultTemplate {
  const SchoolPage({super.key});

  @override
  Widget body(final BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.only(top: 96, bottom: 48),
      child: ListView(
        children: const <Widget>[
          SchoolPageBanner(),
          ProjectImageSlider(),
        ],
      ),
    );
  }
}
