import 'package:flutter/material.dart';
import 'package:portfolio/Component/About/about_page_greeting_banner.dart';
import 'package:portfolio/Component/About/tech_element.dart';
import 'package:portfolio/Component/default_template.dart';

@immutable
class AboutPage extends DefaultTemplate {
  const AboutPage({super.key});

  @override
  Widget body(final BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return ListView(
      children: <Widget>[
        const AboutPageGreetingBanner(),
        Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 96, bottom: 48),
            child: Text(
              '저는 이런 툴들을 사용해 봤습니다',
              style: textTheme.headlineLarge,
            ),
          ),
        ),
        const Wrap(
          alignment: WrapAlignment.spaceEvenly,
          spacing: 24,
          runSpacing: 48,
          children: <Widget>[
            TechElement(height: 144, fileName: 'Cpp_logo'),
            TechElement(height: 144, fileName: 'CS_logo'),
            TechElement(height: 144, fileName: 'Flutter_logo'),
            TechElement(height: 144, fileName: 'Python_logo'),
            TechElement(height: 144, fileName: 'Jupyter_logo'),
            TechElement(height: 144, fileName: 'Javascript_logo'),
            TechElement(height: 144, fileName: 'React_logo'),
            TechElement(height: 144, fileName: 'Tensorflow_logo'),
            TechElement(height: 144, fileName: 'Unreal_logo'),
          ],
        ),
        Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 96, bottom: 48),
            child: Text(
              '그리고 이런 환경에서 작업하고 있습니다',
              style: textTheme.headlineLarge,
            ),
          ),
        ),
        const Wrap(
          alignment: WrapAlignment.spaceEvenly,
          spacing: 24,
          runSpacing: 48,
          children: <Widget>[
            TechElement(height: 144, fileName: 'Windows_logo'),
            TechElement(height: 144, fileName: 'Ubuntu_logo'),
            TechElement(height: 144, fileName: 'VisualStudio_logo'),
            TechElement(height: 144, fileName: 'Vscode_logo'),
            TechElement(height: 144, fileName: 'AndroidStudio_logo'),
          ],
        ),
        const SizedBox(height: 48),
      ],
    );
  }
}
