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

final Handler homePageHandler = Handler(
  handlerFunc: (
    final BuildContext? context,
    final Map<String, List<String>> params,
  ) =>
      const HomePage(),
);
final Handler aboutPageHandler = Handler(
  handlerFunc: (
    final BuildContext? context,
    final Map<String, List<String>> params,
  ) =>
      const AboutPage(),
);
final Handler schoolPageHandler = Handler(
  handlerFunc: (
    final BuildContext? context,
    final Map<String, List<String>> params,
  ) =>
      const SchoolPage(),
);
final Handler projectsPageHandler = Handler(
  handlerFunc: (
    final BuildContext? context,
    final Map<String, List<String>> params,
  ) =>
      const ProjectsPage(),
);
final Handler awardPageHandler = Handler(
  handlerFunc: (
    final BuildContext? context,
    final Map<String, List<String>> params,
  ) =>
      const AwardPage(),
);
final Handler resumePageHandler = Handler(
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
        handler: homePageHandler,
        transitionType: TransitionType.fadeIn,
      )
      ..define(
        aboutPageRoute,
        handler: aboutPageHandler,
        transitionType: TransitionType.fadeIn,
      )
      ..define(
        schoolPageRoute,
        handler: schoolPageHandler,
        transitionType: TransitionType.fadeIn,
      )
      ..define(
        projectsPageRoute,
        handler: projectsPageHandler,
        transitionType: TransitionType.fadeIn,
      )
      ..define(
        awardPageRoute,
        handler: awardPageHandler,
        transitionType: TransitionType.fadeIn,
      )
      ..define(
        resumePageRoute,
        handler: resumePageHandler,
        transitionType: TransitionType.fadeIn,
      );
  }
}
