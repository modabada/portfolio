import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/Component/About/about_page.dart';
import 'package:portfolio/Component/Award/award_page.dart';
import 'package:portfolio/Component/Home/homepage.dart';
import 'package:portfolio/Component/Projects/projects_page.dart';
import 'package:portfolio/Component/Resume/resume_page.dart';
import 'package:portfolio/Component/School/school_page.dart';
import 'package:portfolio/Component/error_page.dart';
import 'package:portfolio/router.dart';

final Handler _homePageHandler = Handler(
  handlerFunc: (
    final BuildContext? context,
    final Map<String, List<String>> params,
  ) =>
      const HomePage(),
);
final Handler _aboutPageHandler = Handler(
  handlerFunc: (
    final BuildContext? context,
    final Map<String, List<String>> params,
  ) =>
      const AboutPage(),
);
final Handler _schoolPageHandler = Handler(
  handlerFunc: (
    final BuildContext? context,
    final Map<String, List<String>> params,
  ) =>
      const SchoolPage(),
);
final Handler _projectsPageHandler = Handler(
  handlerFunc: (
    final BuildContext? context,
    final Map<String, List<String>> params,
  ) =>
      const ProjectsPage(),
);
final Handler _awardPageHandler = Handler(
  handlerFunc: (
    final BuildContext? context,
    final Map<String, List<String>> params,
  ) =>
      const AwardPage(),
);
final Handler _resumePageHandler = Handler(
  handlerFunc: (
    final BuildContext? context,
    final Map<String, List<String>> params,
  ) =>
      const ResumePage(),
);

@immutable
class Routes {
  static void configureRoutes(final FluroRouter router) {
    router
      ..notFoundHandler = Handler(
        handlerFunc: (
          final BuildContext? context,
          final Map<String, List<String>> params,
        ) =>
            const ErrorPage(),
      )
      ..define(
        homePageRoute,
        handler: _homePageHandler,
        transitionType: TransitionType.fadeIn,
      )
      ..define(
        aboutPageRoute,
        handler: _aboutPageHandler,
        transitionType: TransitionType.fadeIn,
      )
      ..define(
        schoolPageRoute,
        handler: _schoolPageHandler,
        transitionType: TransitionType.fadeIn,
      )
      ..define(
        projectsPageRoute,
        handler: _projectsPageHandler,
        transitionType: TransitionType.fadeIn,
      )
      ..define(
        awardPageRoute,
        handler: _awardPageHandler,
        transitionType: TransitionType.fadeIn,
      )
      ..define(
        resumePageRoute,
        handler: _resumePageHandler,
        transitionType: TransitionType.fadeIn,
      );
  }
}
