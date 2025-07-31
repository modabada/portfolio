import 'package:flutter/material.dart';

class SchoolPageBanner extends StatelessWidget {
  const SchoolPageBanner({super.key});

  @override
  Widget build(final BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    final Size screenSize = MediaQuery.of(context).size;

    return SizedBox(
      height: 576,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          SizedBox(
            width: screenSize.width * 0.48,
            child: Text.rich(
              TextSpan(
                style: textTheme.titleLarge,
                children: <InlineSpan>[
                  TextSpan(
                    text: '학교생활에서 가장 큰 자랑\n\n',
                    style: textTheme.displayMedium!.copyWith(
                      color: colorScheme.primary,
                    ),
                  ),
                  const TextSpan(text: '제 학교생활에서 가장 큰 자랑거리는 '),
                  TextSpan(
                    text: '졸업작품',
                    style: TextStyle(
                      color: colorScheme.primary,
                    ),
                  ),
                  const TextSpan(text: '입니다'),
                ],
              ),
            ),
          ),
          Icon(
            Icons.developer_board_rounded,
            color: colorScheme.onSurface,
            size: screenSize.width * 0.24,
          ),
        ],
      ),
    );
  }
}
