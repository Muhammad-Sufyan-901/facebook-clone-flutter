import 'package:flutter/material.dart';

import 'package:facebook_clone/app/themes/app_color_themes.dart';

abstract class ShowModal {
  static void showModal({
    required BuildContext context,
    required ModalVariant variant,
    required String title,
    required Widget content,
    String? buttonText,
    VoidCallback? onPressed,
    List<Widget>? actions,
    ModalTitleWeight titleWeight = ModalTitleWeight.regular,
    double width = 0.85,
  }) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            title,
            style: TextStyle(
                color: _getTitleColor(context, variant),
                fontWeight: _getTitleWeight(titleWeight)),
          ),
          content: SizedBox(
            width: MediaQuery.of(context).size.width * width,
            child: content,
          ),
          actions: actions ??
              <Widget>[
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
          backgroundColor: AppColorThemes.kBackgroundColor(context),
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

  static FontWeight _getTitleWeight(ModalTitleWeight weight) {
    switch (weight) {
      case ModalTitleWeight.bold:
        return FontWeight.bold;
      case ModalTitleWeight.semiBold:
        return FontWeight.w600;
      case ModalTitleWeight.medium:
        return FontWeight.w500;
      case ModalTitleWeight.regular:
      default:
        return FontWeight.normal;
    }
  }
}

enum ModalVariant {
  defaultVariant,
  error,
  warning,
  success,
}

enum ModalTitleWeight {
  bold,
  semiBold,
  medium,
  regular,
}
