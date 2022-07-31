import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import 'package:portfolio/router.dart';
import 'package:portfolio/Component/errorpage.dart';
import 'package:portfolio/Component/Home/homepage.dart';
import 'package:portfolio/Component/About/aboutpage.dart';
import 'package:portfolio/Component/School/schoolpage.dart';
import 'package:portfolio/Component/Projects/projects.dart';
import 'package:portfolio/Component/Award/award.dart';
import 'package:portfolio/Component/Resume/resume.dart';

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
final projectsPageHandler = Handler(
  handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
    return const ProjectsPage();
  },
);
final awardPageHandler = Handler(
  handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
    return const AwardPage();
  },
);
final resumePageHandler = Handler(
  handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
    return const ResumePage();
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
      projectsPageRoute,
      handler: projectsPageHandler,
      transitionType: TransitionType.fadeIn,
    );
    router.define(
      awardPageRoute,
      handler: awardPageHandler,
      transitionType: TransitionType.fadeIn,
    );
    router.define(
      resumePageRoute,
      handler: resumePageHandler,
      transitionType: TransitionType.fadeIn,
    );
  }
}
