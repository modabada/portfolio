import 'package:flutter/material.dart';
import 'package:portfolio/Component/Home/intro_text.dart';

class MyBanner extends StatelessWidget {
  const MyBanner({Key? key}) : super(key: key);

  static final ClipOval _photo = ClipOval(
    clipper: PhotoClipper(),
    child: Image.asset(
      "lib/Assets/Image/IDPhoto.png",
      height: 500,
      width: 372,
      colorBlendMode: BlendMode.clear,
    ),
  );
  final TextStyle _textStyle =
      const TextStyle(fontSize: 48, color: Colors.white);

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Container(
      height: 896,
      color: const Color.fromARGB(50, 0, 0, 0),
      child: Stack(
        children: [
          Image.asset(
            "lib/Assets/Image/banner_back.png",
            height: 896,
            width: screenSize.width,
            fit: BoxFit.cover,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "안녕하세요, 저는",
                      style: _textStyle,
                      overflow: TextOverflow.clip,
                      softWrap: false,
                    ),
                    const IntroText(),
                    Text(
                      "문인우 입니다",
                      style: _textStyle,
                      overflow: TextOverflow.clip,
                      softWrap: false,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  right: screenSize.width * 0.15,
                ),
                child: _photo,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class PhotoClipper extends CustomClipper<Rect> {
  @override
  Rect getClip(Size size) {
    return Rect.fromLTWH(0, 0, size.width, size.height);
  }

  @override
  bool shouldReclip(CustomClipper<Rect> oldClipper) {
    return true;
  }
}
