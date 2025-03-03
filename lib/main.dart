import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/Bloc/Theme/theme_bloc.dart';
import 'package:portfolio/Bloc/Theme/theme_state.dart';
import 'package:portfolio/router.dart';
import 'package:portfolio/router_config.dart';

void main() {
  final FluroRouter router = FluroRouter();
  Routes.configureRoutes(router);
  Application.router = router;
  runApp(const MyApp());
}

@immutable
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(final BuildContext context) => BlocProvider<ThemeBloc>(
        create: (final BuildContext context) => ThemeBloc(),
        child: BlocBuilder<ThemeBloc, ThemeState>(
          builder: (
            final BuildContext context,
            final ThemeState state,
          ) =>
              MaterialApp(
            theme: state.currentTheme.theme,
            title: '문인우의 포트폴리오',
            onGenerateRoute: Application.router.generator,
            initialRoute: homePageRoute,
          ),
        ),
      );
}
