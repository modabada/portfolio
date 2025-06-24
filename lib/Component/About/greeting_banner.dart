import 'package:flutter/material.dart';
import 'package:portfolio/Component/About/waving_hand.dart';

@immutable
class GreetingBanner extends StatelessWidget {
  const GreetingBanner({super.key});

  @override
  Widget build(final BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    final Size screenSize = MediaQuery.of(context).size;

    return Container(
      margin: const EdgeInsets.only(top: 200),
      height: 576,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          SizedBox(
            width: screenSize.width * 0.52,
            child: Text.rich(
              TextSpan(
                style: textTheme.titleLarge,
                children: <InlineSpan>[
                  TextSpan(
                    text: '제가 누구냐면요\n\n',
                    style: textTheme.displayMedium!.copyWith(
                      color: colorScheme.primary,
                    ),
                  ),
                  const TextSpan(
                    text: '안녕하세요, 저는 서울로봇고등학교에서 첨단로봇 제어과를 전공한 ',
                  ),
                  TextSpan(
                    text: '문인우 ',
                    style: TextStyle(color: colorScheme.primary),
                  ),
                  const TextSpan(text: '입니다\n\n'),
                  const TextSpan(text: '코딩 외에도 제가 즐겨 하는 것들은\n'),
                  arrow(colorScheme.onSurface),
                  const TextSpan(text: '컴퓨터게임\n'),
                  arrow(colorScheme.onSurface),
                  const TextSpan(text: '농구\n'),
                  arrow(colorScheme.onSurface),
                  TextSpan(
                    text: '(코딩이나 센서 원리 등의)',
                    style: textTheme.titleSmall,
                  ),
                  const TextSpan(text: '기타 정보 검색\n'),
                  const TextSpan(text: '등이 있습니다'),
                ],
              ),
            ),
          ),
          WavingHand(
            color: colorScheme.onSurface,
            size: screenSize.width * 0.234375,
          ),
        ],
      ),
    );
  }

  WidgetSpan arrow(final Color arrowColor) => WidgetSpan(
        child: Padding(
          padding: const EdgeInsets.only(left: 24, right: 12),
          child: Icon(
            Icons.double_arrow_rounded,
            color: arrowColor,
            size: 24,
          ),
        ),
      );
}
