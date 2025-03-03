import 'package:flutter/foundation.dart';

@immutable
abstract class ThemeEvent {
  const ThemeEvent();

// TODO(modabada): 로깅 등의 모니터 등 추가 예정
}

@immutable
class ToggleThemeBtnPressed extends ThemeEvent {}
