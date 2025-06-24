import 'package:flutter_test/flutter_test.dart';
import 'package:portfolio/Bloc/Theme/theme_bloc.dart';
import 'package:portfolio/Core/Theme/app_theme.dart';

void main() {
  group(
    ThemeBloc,
    () {
      late ThemeBloc bloc;

      setUp(() => bloc = ThemeBloc());

      test('Test Initial State', () {
        expect(
          bloc.state.currentTheme.theme,
          LightTheme().theme,
        );
      });
    },
  );
}
