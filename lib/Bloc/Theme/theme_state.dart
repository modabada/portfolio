import 'package:portfolio/Core/Theme/app_theme.dart';

class ThemeState {
  const ThemeState({required this.currentTheme});

  final AppTheme currentTheme;

  factory ThemeState.init() {
    return ThemeState(currentTheme: LightTheme());
  }

  ThemeState update({required AppTheme theme}) {
    return ThemeState(currentTheme: theme);
  }
}
