import 'package:flutter/material.dart';

import 'package:flutter_boilerplate/app/themes/app_color_themes.dart';

abstract class ShowModal {
  static void showModal({
    required BuildContext context,
    required ModalVariant variant,
    required String title,
    required Widget content,
    String? buttonText,
    VoidCallback? onPressed,
  }) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            title,
            style: TextStyle(
              color: _getTitleColor(context, variant),
            ),
          ),
          content: content,
          actions: <Widget>[
            TextButton(
              onPressed: onPressed ?? () => Navigator.of(context).pop(),
              child: Text(
                buttonText ?? 'OK',
                style: TextStyle(
                  color: _getButtonColor(context, variant),
                ),
              ),
            ),
          ],
          backgroundColor: _getBackgroundColor(context, variant),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        );
      },
    );
  }

  static Color _getTitleColor(BuildContext context, ModalVariant variant) {
    switch (variant) {
      case ModalVariant.error:
        return AppColorThemes.kErrorColor(context);
      case ModalVariant.warning:
        return AppColorThemes.kWarningColor(context);
      case ModalVariant.success:
        return AppColorThemes.kSuccessColor(context);
      case ModalVariant.defaultVariant:
      default:
        return AppColorThemes.kTextColor(context);
    }
  }

  static Color _getBackgroundColor(BuildContext context, ModalVariant variant) {
    switch (variant) {
      case ModalVariant.error:
        return AppColorThemes.kErrorColor(context).withOpacity(0.1);
      case ModalVariant.warning:
        return AppColorThemes.kWarningColor(context).withOpacity(0.1);
      case ModalVariant.success:
        return AppColorThemes.kSuccessColor(context).withOpacity(0.1);
      case ModalVariant.defaultVariant:
      default:
        return AppColorThemes.kBackgroundColor(context);
    }
  }

  static Color _getButtonColor(BuildContext context, ModalVariant variant) {
    switch (variant) {
      case ModalVariant.error:
        return AppColorThemes.kErrorColor(context);
      case ModalVariant.warning:
        return AppColorThemes.kWarningColor(context);
      case ModalVariant.success:
        return AppColorThemes.kSuccessColor(context);
      case ModalVariant.defaultVariant:
      default:
        return AppColorThemes.kPrimaryColor(context);
    }
  }
}

enum ModalVariant {
  defaultVariant,
  error,
  warning,
  success,
}
