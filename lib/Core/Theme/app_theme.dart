import 'package:flutter/material.dart';
import 'package:portfolio/Core/Theme/app_theme.dart';
import 'package:portfolio/Core/Theme/basic_color.dart';

abstract class AppTheme {
  const AppTheme({required this.theme});

  final ThemeData theme;
}

class LightTheme extends AppTheme {
  @override
  LightTheme()
      : super(
            theme: ThemeData(
          brightness: Brightness.light,
        ));
}

class DarkTheme extends AppTheme {
  @override
  DarkTheme()
      : super(
            theme: ThemeData(
          brightness: Brightness.dark,
        ));
}
