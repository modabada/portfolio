import 'package:flutter/material.dart';

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
            colorSchemeSeed: Colors.lightBlue,
          ),
        );
}

class DarkTheme extends AppTheme {
  @override
  DarkTheme()
      : super(
          theme: ThemeData(
            brightness: Brightness.dark,
            colorSchemeSeed: Colors.deepPurple,
          ),
        );
}
