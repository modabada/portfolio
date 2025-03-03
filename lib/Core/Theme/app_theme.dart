import 'package:flutter/material.dart';

@immutable
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
            ),
          ),
        );
}

@immutable
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
