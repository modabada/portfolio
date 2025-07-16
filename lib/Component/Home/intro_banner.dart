import 'package:flutter/material.dart';
import 'package:portfolio/Component/Home/intro_text.dart';

@immutable
class IntroBanner extends StatelessWidget {
  const IntroBanner({super.key});

  @override
  Widget build(final BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    final Size screenSize = MediaQuery.of(context).size;
    final TextStyle textStyle = textTheme.displayMedium!.copyWith(
      fontWeight: FontWeight.w500,
    );
    return SizedBox(
      height: 896,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  '안녕하세요, 저는',
                  style: textStyle,
                  overflow: TextOverflow.clip,
                  softWrap: false,
                ),
                const IntroText(),
                Text(
                  '문인우 입니다',
                  style: textStyle,
                  overflow: TextOverflow.clip,
                  softWrap: false,
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: screenSize.width * 0.08),
            child: ConstrainedBox(
              constraints: const BoxConstraints(
                minWidth: 181.35,
                minHeight: 243.74891,
              ),
              child: Container(
                width: screenSize.width * 0.16,
                height: screenSize.width * 0.16 * 1.34408,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('lib/Assets/Image/IDPhoto.png'),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.elliptical(1000, 1344.08),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
