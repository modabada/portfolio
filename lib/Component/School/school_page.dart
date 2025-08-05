import 'dart:async';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/Component/School/project_image_slider.dart';
import 'package:portfolio/Component/School/school_page_banner.dart';
import 'package:portfolio/Component/School/school_page_body.dart';
import 'package:portfolio/Component/default_template.dart';
import 'package:url_launcher/url_launcher.dart';

@immutable
class SchoolPage extends DefaultTemplate {
  const SchoolPage({super.key});

  @override
  Widget body(final BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.only(top: 96, bottom: 48),
      child: ListView(
        children: <Widget>[
          const SchoolPageBanner(),
          const ProjectImageSlider(),
          Center(
            child: Text.rich(
              style: textTheme.titleLarge,
              TextSpan(
                text: 'Github link',
                recognizer: TapGestureRecognizer()
                  ..onTap = () => unawaited(
                        launchUrl(
                          Uri.parse(
                            'https://github.com/untitled-blockbuster/balancingCube',
                          ),
                        ),
                      ),
              ),
            ),
          ),
          const SizedBox(height: 48),
          const SchoolPageBody(),
        ],
      ),
    );
  }
}
