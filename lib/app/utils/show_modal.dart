import 'package:flutter/material.dart';

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
              color: _getTitleColor(variant),
            ),
          ),
          content: content,
          actions: <Widget>[
            TextButton(
              onPressed: onPressed ?? () => Navigator.of(context).pop(),
              child: Text(
                buttonText ?? 'OK',
                style: TextStyle(
                  color: _getButtonColor(variant),
                ),
              ),
            ),
          ],
          backgroundColor: _getBackgroundColor(variant),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        );
      },
    );
  }

  static Color _getTitleColor(ModalVariant variant) {
    switch (variant) {
      case ModalVariant.error:
        return Colors.red;
      case ModalVariant.warning:
        return Colors.orange;
      case ModalVariant.success:
        return Colors.green;
      case ModalVariant.defaultVariant:
      default:
        return Colors.black;
    }
  }

  static Color _getBackgroundColor(ModalVariant variant) {
    switch (variant) {
      case ModalVariant.error:
        return Colors.red[50]!;
      case ModalVariant.warning:
        return Colors.orange[50]!;
      case ModalVariant.success:
        return Colors.green[50]!;
      case ModalVariant.defaultVariant:
      default:
        return Colors.white;
    }
  }

  static Color _getButtonColor(ModalVariant variant) {
    switch (variant) {
      case ModalVariant.error:
        return Colors.red;
      case ModalVariant.warning:
        return Colors.orange;
      case ModalVariant.success:
        return Colors.green;
      case ModalVariant.defaultVariant:
      default:
        return Colors.blue;
    }
  }
}

enum ModalVariant {
  defaultVariant,
  error,
  warning,
  success,
}
