import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import 'package:portfolio/router.dart';
import 'package:portfolio/Component/errorpage.dart';
import 'package:portfolio/Component/Home/homepage.dart';
import 'package:portfolio/Component/mobilepage.dart';
import 'package:portfolio/Component/About/aboutpage.dart';
import 'package:portfolio/Component/School/schoolpage.dart';

final homePageHandler = Handler(
  handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
    return const HomePage();
  },
);
final aboutPageHandler = Handler(
  handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
    return const AboutPage();
  },
);
final schoolPageHandler = Handler(
  handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
    return const SchoolPage();
  },
);
final mobilePageHandler = Handler(
  handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
    return const MobilePage();
  },
);

class Routes {
  static void configureRoutes(FluroRouter router) {
    router.notFoundHandler = Handler(
      handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
        return const ErrorPage();
      },
    );
    router.define(
      homePageRoute,
      handler: homePageHandler,
      transitionType: TransitionType.fadeIn,
    );
    router.define(
      aboutPageRoute,
      handler: aboutPageHandler,
      transitionType: TransitionType.fadeIn,
    );
    router.define(
      schoolPageRoute,
      handler: schoolPageHandler,
      transitionType: TransitionType.fadeIn,
    );
    router.define(
      mobilePageRoute,
      handler: mobilePageHandler,
      transitionDuration: Duration.zero,
    );
  }
}
