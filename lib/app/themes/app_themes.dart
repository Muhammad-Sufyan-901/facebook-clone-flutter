import 'package:flutter/material.dart';

import 'package:facebook_clone/app/themes/app_color_themes.dart';
import 'package:facebook_clone/app/themes/app_text_themes.dart';

abstract class AppThemes {
  static ThemeData get theme {
    return ThemeData().copyWith(
      brightness: Brightness.light,
      colorScheme: AppColorThemes.kLightColorScheme,
      textTheme: AppTextThemes.textTheme.apply(
        bodyColor: AppColorThemes.kLightTextColor,
        displayColor: AppColorThemes.kLightTextColor,
      ),
    );
  }

  static ThemeData get darkTheme {
    return ThemeData().copyWith(
      brightness: Brightness.dark,
      colorScheme: AppColorThemes.kDarkColorScheme,
      textTheme: AppTextThemes.textTheme.apply(
        bodyColor: AppColorThemes.kDarkTextColor,
        displayColor: AppColorThemes.kDarkTextColor,
      ),
    );
  }
}
