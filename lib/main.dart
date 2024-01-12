import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/Bloc/Theme/theme_bloc.dart';
import 'package:portfolio/Bloc/Theme/theme_state.dart';
import 'package:portfolio/router_config.dart';
import 'package:portfolio/router.dart';

void main() {
  final router = FluroRouter();
  Routes.configureRoutes(router);
  Application.router = router;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ThemeBloc(),
      child: BlocBuilder<ThemeBloc, ThemeState>(builder: (context, state) {
        return MaterialApp(
          theme: state.currentTheme.theme,
          title: "문인우의 포트폴리오",
          onGenerateRoute: Application.router.generator,
          initialRoute: homePageRoute,
        );
      }),
    );
  }
}
