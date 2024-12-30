import 'package:flutter/material.dart';

import 'package:flutter_boilerplate/app/themes/app_color_themes.dart';

abstract class ShowSnackBar {
  static void showSnackBar({
    required BuildContext context,
    required SnackBarVariant variant,
    required String message,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: _getBackgroundColor(context, variant),
        content: Text(
          message,
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: _getTextColor(context, variant),
                fontWeight: FontWeight.w600,
              ),
        ),
      ),
    );
  }

  static Color _getBackgroundColor(
      BuildContext context, SnackBarVariant variant) {
    switch (variant) {
      case SnackBarVariant.error:
        return AppColorThemes.kErrorColor(context);
      case SnackBarVariant.warning:
        return AppColorThemes.kWarningColor(context);
      case SnackBarVariant.success:
        return AppColorThemes.kSuccessColor(context);
      case SnackBarVariant.info:
        return AppColorThemes.kTertiaryColor(context);
      case SnackBarVariant.primary:
        return AppColorThemes.kPrimaryColor(context);
      case SnackBarVariant.defaultVariant:
      default:
        return AppColorThemes.kGreyColor(context);
    }
  }

  static Color _getTextColor(BuildContext context, SnackBarVariant variant) {
    switch (variant) {
      case SnackBarVariant.error:
        return Theme.of(context).colorScheme.onError;
      default:
        return Theme.of(context).colorScheme.onPrimary;
    }
  }
}

enum SnackBarVariant {
  defaultVariant,
  primary,
  info,
  error,
  warning,
  success,
}
