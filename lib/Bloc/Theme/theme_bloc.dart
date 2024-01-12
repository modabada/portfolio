import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/Bloc/Theme/theme_event.dart';
import 'package:portfolio/Bloc/Theme/theme_state.dart';
import 'package:portfolio/Core/Theme/app_theme.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(ThemeState.init()) {
    on<ThemeEvent>((ThemeEvent event, emit) {
      if (event is ToggleThemeBtnPressed) {
        emit(
          state.update(
            theme:
                state.currentTheme is LightTheme ? DarkTheme() : LightTheme(),
          ),
        );
      }
      return;
    });
  }
}
