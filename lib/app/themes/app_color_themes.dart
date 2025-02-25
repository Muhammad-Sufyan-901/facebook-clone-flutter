import 'package:flutter/material.dart';

abstract class AppColorThemes {
  // Light Themed Colors
  static const Color kLightPrimaryColor = Color.fromARGB(255, 50, 102, 253);
  static const Color kLightSecondaryColor = Color.fromARGB(255, 40, 80, 186);
  static const Color kLightTertiaryColor = Color.fromARGB(255, 236, 224, 246);
  static const Color kLightAccentColor = Color.fromARGB(255, 239, 77, 75);
  static const Color kLightFillColor = Color.fromARGB(255, 36, 37, 38);
  static const Color kLightGreyColor = Color.fromARGB(255, 228, 230, 235);
  static const Color kLightBackgroundColor = Color.fromARGB(255, 4, 4, 4);
  static const Color kLightCardBackgroundColor =
      Color.fromARGB(255, 24, 25, 26);
  static const Color kLightTextColor = Color.fromARGB(255, 255, 255, 255);
  static const Color kLightDividerColor = Color.fromARGB(255, 176, 179, 184);
  static const Color kLightIconColor = Color.fromARGB(255, 255, 255, 255);
  static const Color kLightSuccessColor = Color.fromARGB(255, 0, 200, 81);
  static const Color kLightWarningColor = Color.fromARGB(255, 255, 193, 7);
  static const Color kLightErrorColor = Color.fromARGB(255, 221, 35, 52);
  static const Color kLightInfoColor = Color.fromARGB(255, 88, 162, 246);
  static const Color kLightDisabledColor = Color.fromARGB(255, 189, 189, 189);
  static const Color kLightDisabledTextColor =
      Color.fromARGB(255, 158, 158, 158);
  static const Color kLightDisabledBackgroundColor =
      Color.fromARGB(255, 224, 224, 224);

  // Dark Themed Colors
  static const Color kDarkPrimaryColor = Color.fromARGB(255, 50, 102, 253);
  static const Color kDarkSecondaryColor = Color.fromARGB(255, 40, 80, 186);
  static const Color kDarkTertiaryColor = Color.fromARGB(255, 236, 224, 246);
  static const Color kDarkAccentColor = Color.fromARGB(255, 239, 77, 75);
  static const Color kDarkFillColor = Color.fromARGB(255, 36, 37, 38);
  static const Color kDarkGreyColor = Color.fromARGB(255, 228, 230, 235);
  static const Color kDarkBackgroundColor = Color.fromARGB(255, 4, 4, 4);
  static const Color kDarkCardBackgroundColor = Color.fromARGB(255, 24, 25, 26);
  static const Color kDarkTextColor = Color.fromARGB(255, 255, 255, 255);
  static const Color kDarkDividerColor = Color.fromARGB(255, 176, 179, 184);
  static const Color kDarkIconColor = Color.fromARGB(255, 255, 255, 255);
  static const Color kDarkSuccessColor = Color.fromARGB(255, 0, 200, 81);
  static const Color kDarkWarningColor = Color.fromARGB(255, 255, 193, 7);
  static const Color kDarkErrorColor = Color.fromARGB(255, 221, 35, 52);
  static const Color kDarkInfoColor = Color.fromARGB(255, 88, 162, 246);
  static const Color kDarkDisabledColor = Color.fromARGB(255, 189, 189, 189);
  static const Color kDarkDisabledTextColor =
      Color.fromARGB(255, 158, 158, 158);
  static const Color kDarkDisabledBackgroundColor =
      Color.fromARGB(255, 224, 224, 224);

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

  static Color kCardBackgroundColor(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark
        ? kDarkCardBackgroundColor
        : kLightCardBackgroundColor;
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

  static Color kInfoColor(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark
        ? kDarkInfoColor
        : kLightInfoColor;
  }

  static Color kDisabledColor(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark
        ? kDarkDisabledColor
        : kLightDisabledColor;
  }

  static Color kDisabledTextColor(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark
        ? kDarkDisabledTextColor
        : kLightDisabledTextColor;
  }

  static Color kDisabledBackgroundColor(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark
        ? kDarkDisabledBackgroundColor
        : kLightDisabledBackgroundColor;
  }
}
