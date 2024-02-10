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
            useMaterial3: true,
            colorScheme: ColorScheme.fromSeed(
              seedColor: Colors.lightBlue,
              brightness: Brightness.light,
            ),
          ),
        );
}

class DarkTheme extends AppTheme {
  @override
  DarkTheme()
      : super(
          theme: ThemeData(
            useMaterial3: true,
            colorScheme: ColorScheme.fromSeed(
              seedColor: Colors.deepPurple,
              brightness: Brightness.dark,
            ),
          ),
        );
}
