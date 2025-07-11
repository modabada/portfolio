import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/Bloc/Theme/theme_bloc.dart';
import 'package:portfolio/Bloc/Theme/theme_event.dart';

class DarkModeButton extends StatelessWidget {
  const DarkModeButton({super.key});

  @override
  Widget build(final BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    final ThemeBloc themeBloc = context.read<ThemeBloc>();

    final bool isLightTheme =
        themeBloc.state.currentTheme.theme.brightness == Brightness.light;

    return IconButton(
      onPressed: () => themeBloc.add(ToggleThemeBtnPressed()),
      icon: Center(
        child: Icon(
          isLightTheme ? Icons.light_mode_rounded : Icons.dark_mode_rounded,
          size: 40,
          color: colorScheme.primary,
        ),
      ),
    );
  }
}
