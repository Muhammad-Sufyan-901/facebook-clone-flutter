import 'package:flutter/material.dart';

abstract class ShowSnackBar {
  static void showSnackBar({
    required BuildContext context,
    required SnackBarVariant variant,
    required String message,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: _getBackgroundColor(variant),
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

  static Color _getBackgroundColor(SnackBarVariant variant) {
    switch (variant) {
      case SnackBarVariant.error:
        return Colors.red[400]!;
      case SnackBarVariant.warning:
        return Colors.orange[400]!;
      case SnackBarVariant.success:
        return Colors.green[400]!;
      case SnackBarVariant.info:
        return Colors.cyan[400]!;
      case SnackBarVariant.primary:
        return Colors.blue;
      case SnackBarVariant.defaultVariant:
      default:
        return Colors.blueGrey[400]!;
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
