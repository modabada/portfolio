import 'package:flutter/material.dart';

@immutable
class SchoolPageBody extends StatelessWidget {
  const SchoolPageBody({super.key});

  @override
  Widget build(final BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    final ColorScheme colorScheme = Theme.of(context).colorScheme;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            '저의 졸업작품 입니다.',
            style: textTheme.displayMedium?.copyWith(
              color: colorScheme.primary,
            ),
          ),
          const SizedBox(height: 16),
          Text.rich(
            style: textTheme.titleLarge,
            TextSpan(
              children: <TextSpan>[
                const TextSpan(text: '제 졸업작품은 '),
                TextSpan(
                  text: '스스로 균형을 잡는 큐브 ',
                  style: TextStyle(color: colorScheme.primary),
                ),
                const TextSpan(text: '입니다.\n\n'),
                TextSpan(
                  text: '하드웨어와 회로 설계는 ',
                  style: TextStyle(color: colorScheme.primary),
                ),
                const TextSpan(
                  text: '저와 함께한 찬용이, 동건이가 했고\n',
                ),
                const TextSpan(text: '그리고 저는 큐브에 들어가는 '),
                TextSpan(
                  text: '소프트웨어 일체',
                  style: TextStyle(color: colorScheme.primary),
                ),
                const TextSpan(text: '를 담당했습니다.\n\n'),
                const TextSpan(text: '이 작품을 만들면서 저는 다양한 '),
                TextSpan(
                  text: '센서, 모터, 제어 시스템',
                  style: TextStyle(color: colorScheme.primary),
                ),
                const TextSpan(text: '을 경험해 봤습니다.'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
