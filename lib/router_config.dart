import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import 'package:portfolio/router.dart';
import 'package:portfolio/Component/Home/homepage.dart';
import 'package:portfolio/Component/About/aboutpage.dart';
import 'package:portfolio/Component/School/schoolpage.dart';

var homePageHandler = Handler(
  handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
    return const HomePage();
  },
);
var aboutPageHandler = Handler(
  handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
    return const AboutPage();
  },
);
var schoolPageHandler = Handler(
  handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
    return const SchoolPage();
  },
);

class Routes {
  static void configureRoutes(FluroRouter router) {
    router.notFoundHandler = Handler(
      handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
        print("ROUTE WAS NOT FOUND !!!");
        return;
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
  }
}
