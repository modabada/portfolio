import 'package:fluro/fluro.dart';
import 'package:flutter/foundation.dart';

const String homePageRoute = '/';
const String aboutPageRoute = '/about';
const String schoolPageRoute = '/school';
const String projectsPageRoute = '/projects';
const String awardPageRoute = '/award';
const String resumePageRoute = '/resume';

@immutable
class Application {
  static late final FluroRouter router;
}
