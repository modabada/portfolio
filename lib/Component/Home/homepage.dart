import 'package:flutter/material.dart';
import 'package:portfolio/Component/Home/intro_banner.dart';
import 'package:portfolio/Component/default_template.dart';

class HomePage extends DefaultTemplate {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget body(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    final summaryTextStyle = textTheme.labelLarge;
    final summaryTextStyleAccent = summaryTextStyle?.copyWith(
      color: colorScheme.primary,
    );

    return ListView(
      children: [
        const IntroBanner(),
        SizedBox(
          height: 600,
          child: Center(
            child: Text.rich(
              style: summaryTextStyle,
              TextSpan(
                children: [
                  TextSpan(
                    text: "안녕하세요?\n",
                    style: textTheme.displayMedium?.copyWith(
                      color: colorScheme.primary,
                    ),
                  ),
                  const TextSpan(
                    text: "저는 소프트웨어로 프로그램을 만드는 일을 좋아하고 그에 따라, ",
                  ),
                  TextSpan(
                    text: "최소한은 알고있다고 생각합니다\n\n",
                    style: summaryTextStyleAccent,
                  ),
                  const TextSpan(
                    text: "저는 ",
                  ),
                  TextSpan(
                    text: "Python, C#",
                    style: summaryTextStyleAccent,
                  ),
                  const TextSpan(
                    text: "과 같이 현대적인 언어에 비교적 익숙합니다\n\n",
                  ),
                  const TextSpan(
                    text: "저는 ",
                  ),
                  TextSpan(
                    text: "어플리케이션 제작, DBA, 백엔드, 게임",
                    style: summaryTextStyleAccent,
                  ),
                  const TextSpan(
                    text: "등에 관심이 있으며\n",
                  ),
                  TextSpan(
                    text: "웹 프론트엔드, 게임, 어플리케이션, 간단한 AI, 제어시스템",
                    style: summaryTextStyleAccent,
                  ),
                  const TextSpan(
                    text: "등을 만들어본 경험이 있습니다",
                  ),
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(50),
          child: Center(
            child: Text.rich(
              style: textTheme.titleMedium,
              softWrap: false,
              TextSpan(
                children: [
                  TextSpan(
                    text: "FIND ME ON\n",
                    style: textTheme.displaySmall?.copyWith(
                      color: colorScheme.primary,
                    ),
                  ),
                  WidgetSpan(
                    child: Icon(
                      Icons.call,
                      color: colorScheme.onSurface,
                    ),
                  ),
                  const TextSpan(text: " 010-9297-9467\n"),
                  WidgetSpan(
                    child: Icon(
                      Icons.mail,
                      color: colorScheme.onSurface,
                    ),
                  ),
                  const TextSpan(text: " miw1102@naver.com\n"),
                  WidgetSpan(
                    child: Image.asset(
                      "lib/Assets/Image/githubIcon.png",
                      height: textTheme.titleMedium!.fontSize! *
                          textTheme.titleMedium!.height!,
                      color: colorScheme.onSurface,
                    ),
                  ),
                  const TextSpan(text: " https://github.com/modabada"),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
