import 'package:flutter/material.dart';
import 'package:portfolio/Component/Home/intro_text.dart';

@immutable
class IntroBanner extends StatelessWidget {
  const IntroBanner({super.key});

  TextStyle get _textStyle => const TextStyle(
        fontSize: 48,
        color: Colors.white,
      );

  @override
  Widget build(final BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return Container(
      height: 896,
      color: Colors.black.withAlpha(50),
      child: Stack(
        children: <Widget>[
          Image.asset(
            'lib/Assets/Image/banner_back.png',
            height: 896,
            width: screenSize.width,
            fit: BoxFit.cover,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      '안녕하세요, 저는',
                      style: _textStyle,
                      overflow: TextOverflow.clip,
                      softWrap: false,
                    ),
                    const IntroText(),
                    Text(
                      '문인우 입니다',
                      style: _textStyle,
                      overflow: TextOverflow.clip,
                      softWrap: false,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: screenSize.width * 0.15),
                child: ConstrainedBox(
                  constraints: const BoxConstraints(
                    minWidth: 181.35,
                    minHeight: 243.74891,
                  ),
                  child: Container(
                    width: screenSize.width * 0.19375,
                    height: screenSize.width * 0.19375 * 1.34408,
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
        ],
      ),
    );
  }
}
