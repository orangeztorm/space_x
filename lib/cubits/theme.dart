import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

import '../utils/index.dart';

enum ThemeState { light, dark, black, system }

final Map<ThemeState, ThemeData> _themeData = {
  ThemeState.light: Style.light,
  ThemeState.dark: Style.dark,
  ThemeState.black: Style.black
};

/// saves and load information regarding the theme setting
class ThemeCubit extends HydratedCubit<ThemeState> {
  static const defaultTheme = ThemeState.system;

  ThemeCubit() : super(defaultTheme);

  @override
  ThemeState fromJson(Map<String, dynamic> json) {
    return ThemeState.values[json['value']];
  }

  @override
  Map<String, dynamic> toJson(ThemeState state) {
    return {'value': state.index};
  }

  ThemeState get theme => state;

  set theme(ThemeState themeState) => emit(themeState);

  /// return the appropiate theme modes
  ThemeMode get themeMode {
    switch (state) {
      case ThemeState.light:
        return ThemeMode.light;
        break;
      case ThemeState.dark:
        return ThemeMode.dark;
        break;
      case ThemeState.black:
        return ThemeMode.dark;
      default:
        return ThemeMode.system;
    }
  }

  /// Default light theme
  ThemeData get lightTheme => _themeData[ThemeState.light];

  /// Default dark theme
  ThemeData get darkTheme => state == ThemeState.black
      ? _themeData[ThemeState.black]
      : _themeData[ThemeState.dark];
}
