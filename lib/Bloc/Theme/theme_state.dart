import 'package:flutter/foundation.dart';
import 'package:portfolio/Core/Theme/app_theme.dart';

/// 테마 상태 관련 VO
@immutable
class ThemeState {
  const ThemeState({required this.currentTheme});

  factory ThemeState.init() => ThemeState(currentTheme: LightTheme());

  final AppTheme currentTheme;

  ThemeState fromAppTheme({required final AppTheme theme}) =>
      ThemeState(currentTheme: theme);
}
