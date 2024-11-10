import 'package:flutter/material.dart';

abstract class AppColorThemes {
  // Light Themed Colors
  static const Color kLightPrimaryColor = Color(0xFF5AB1FE);
  static const Color kLightSecondaryColor = Color(0xFF2850BA);
  static const Color kLightTertiaryColor = Color(0xFFECE0F6);
  static const Color kLightAccentColor = Color(0xFFEF4D4B);
  static const Color kLightFillColor = Color(0xFFdff6fe);
  static const Color kLightGreyColor = Color(0xFF6D757E);
  static const Color kLightBackgroundColor = Color(0xFFF8F9FB);
  static const Color kLightTextColor = Color(0xFF1E2022);
  static const Color kLightDividerColor = Color(0xFFE5E5E5);
  static const Color kLightIconColor = Color(0xFF1E2022);
  static const Color kLightSuccessColor = Color(0xFF00C851);
  static const Color kLightWarningColor = Color(0xFFFFC107);
  static const Color kLightErrorColor = Color(0xFFF44336);

  // Dark Themed Colors
  static const Color kDarkPrimaryColor = Color(0xFF5AB1FE);
  static const Color kDarkSecondaryColor = Color(0xFF2850BA);
  static const Color kDarkTertiaryColor = Color(0xFFECE0F6);
  static const Color kDarkAccentColor = Color(0xFFEF4D4B);
  static const Color kDarkFillColor = Color(0xFFdff6fe);
  static const Color kDarkGreyColor = Color(0xFF6D757E);
  static const Color kDarkBackgroundColor = Color(0xFFF8F9FB);
  static const Color kDarkTextColor = Color(0xFF1E2022);
  static const Color kDarkDividerColor = Color(0xFFE5E5E5);
  static const Color kDarkIconColor = Color(0xFF1E2022);
  static const Color kDarkSuccessColor = Color(0xFF00C851);
  static const Color kDarkWarningColor = Color(0xFFFFC107);
  static const Color kDarkErrorColor = Color(0xFFF44336);

  // Primary Color Scheme
  static const ColorScheme kLightColorScheme = ColorScheme.light(
    primary: kLightPrimaryColor,
    secondary: kLightSecondaryColor,
    tertiary: kLightTertiaryColor,
    surface: kLightBackgroundColor,
    error: kLightErrorColor,
  );

  static const ColorScheme kDarkColorScheme = ColorScheme.dark(
    primary: kDarkPrimaryColor,
    secondary: kDarkSecondaryColor,
    tertiary: kDarkTertiaryColor,
    surface: kDarkBackgroundColor,
    error: kDarkErrorColor,
  );

  static ColorScheme getColorScheme(bool isDarkMode) {
    return isDarkMode ? kDarkColorScheme : kLightColorScheme;
  }

  static Color kPrimaryColor(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark
        ? kDarkPrimaryColor
        : kLightPrimaryColor;
  }

  static Color kSecondaryColor(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark
        ? kDarkSecondaryColor
        : kLightSecondaryColor;
  }

  static Color kTertiaryColor(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark
        ? kDarkTertiaryColor
        : kLightTertiaryColor;
  }

  static Color kAccentColor(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark
        ? kDarkAccentColor
        : kLightAccentColor;
  }

  static Color kFillColor(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark
        ? kDarkFillColor
        : kLightFillColor;
  }

  static Color kGreyColor(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark
        ? kDarkGreyColor
        : kLightGreyColor;
  }

  static Color kBackgroundColor(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark
        ? kDarkBackgroundColor
        : kLightBackgroundColor;
  }

  static Color kTextColor(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark
        ? kDarkTextColor
        : kLightTextColor;
  }

  static Color kDividerColor(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark
        ? kDarkDividerColor
        : kLightDividerColor;
  }

  static Color kIconColor(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark
        ? kDarkIconColor
        : kLightIconColor;
  }

  static Color kSuccessColor(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark
        ? kDarkSuccessColor
        : kLightSuccessColor;
  }

  static Color kWarningColor(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark
        ? kDarkWarningColor
        : kLightWarningColor;
  }

  static Color kErrorColor(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark
        ? kDarkErrorColor
        : kLightErrorColor;
  }
}
