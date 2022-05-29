import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import 'package:portfolio/router.dart';
import 'package:portfolio/Component/Home/homepage.dart';

var homePageHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
  return const HomePage();
});

class Routes {

  static void configureRoutes(FluroRouter router) {
    router.notFoundHandler = Handler(
        handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
      print("ROUTE WAS NOT FOUND !!!");
      return;
    });
    router.define(homePageRoute,
        handler: homePageHandler, transitionDuration: const Duration(seconds: 0));
  }
}
