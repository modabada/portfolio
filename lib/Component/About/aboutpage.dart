import 'package:flutter/material.dart';
import 'package:portfolio/Component/default_template.dart';
import 'package:portfolio/Component/About/greeting_banner.dart';
import 'package:portfolio/Component/About/tech_element.dart';


const TextStyle large = TextStyle(
  fontSize: 48,
);

class AboutPage extends DefaultTemplate {
  const AboutPage({Key? key}) : super(key: key);

  @override
  Widget body(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;


    return ListView(
      children: [
        const GreetingBanner(),
        Center(
          child: Padding(
            padding:const  EdgeInsets.only(top: 100, bottom: 50),
            child: Text(
              "저는 이런 툴들을 사용해 봤습니다",
              style: textTheme.headlineLarge,
            ),
          ),
        ),
        const Wrap(
          alignment: WrapAlignment.spaceEvenly,
          spacing: 20,
          runSpacing: 50,
          children:  [
            TechElement(height: 150, fileName: "Cpp_logo"),
            TechElement(height: 150, fileName: "CS_logo"),
            TechElement(height: 150, fileName: "Flutter_logo"),
            TechElement(height: 150, fileName: "Java_logo"),
            TechElement(height: 150, fileName: "Javascript_logo"),
            TechElement(height: 150, fileName: "Jupyter_logo"),
            TechElement(height: 150, fileName: "Python_logo"),
            TechElement(height: 150, fileName: "React_logo"),
            TechElement(height: 150, fileName: "Tensorflow_logo"),
            TechElement(height: 150, fileName: "Unity_logo"),
            TechElement(height: 150, fileName: "Xamarin_logo")
          ],
        ),
        Center(
          child: Padding(
            padding:const  EdgeInsets.only(top: 100, bottom: 50),
            child: Text(
              "그리고 이런 환경에서 작업하고 있습니다",
              style: textTheme.headlineLarge,
            ),
          ),
        ),
        const Wrap(
          alignment: WrapAlignment.spaceEvenly,
          spacing: 20,
          runSpacing: 50,
          children:  [
            TechElement(height: 150, fileName: "Windows_logo"),
            TechElement(height: 150, fileName: "VisualStudio_logo"),
            TechElement(height: 150, fileName: "Vscode_logo"),
            TechElement(height: 150, fileName: "AndroidStudio_logo"),
          ],
        ),
        const SizedBox(height: 50),
      ],
    );
  }
}
