import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/Bloc/Theme/theme_event.dart';
import 'package:portfolio/Bloc/Theme/theme_state.dart';
import 'package:portfolio/Core/Theme/app_theme.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(ThemeState.init()) {
    on<ThemeEvent>((final ThemeEvent event, final Emitter<ThemeState> emit) {
      if (event is ToggleThemeBtnPressed) {
        emit(
          state.fromAppTheme(
            theme:
                state.currentTheme is LightTheme ? DarkTheme() : LightTheme(),
          ),
        );
      }
      return;
    });
  }
}
