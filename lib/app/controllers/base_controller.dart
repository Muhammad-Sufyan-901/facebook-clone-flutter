import 'package:flutter/material.dart';

class BaseController {
  void navigateTo(
    BuildContext context,
    String routeName, {
    Object? arguments,
  }) {
    Navigator.of(context).pushNamed(
      routeName,
      arguments: arguments,
    );
  }

  void navigateAndReplaceTo(
    BuildContext context,
    String routeName, {
    Object? arguments,
  }) {
    Navigator.of(context).pushReplacementNamed(
      routeName,
      arguments: arguments,
    );
  }

  void navigateAndRemoveTo(
    BuildContext context,
    String routeName, {
    Object? arguments,
  }) {
    Navigator.of(context).pushNamedAndRemoveUntil(
      routeName,
      (Route<dynamic> route) => false,
      arguments: arguments,
    );
  }

  void navigateToThenDo(
    BuildContext context,
    String routeName, {
    Object? arguments,
    required void Function() thenDo,
  }) {
    Navigator.of(context)
        .pushNamed(
          routeName,
          arguments: arguments,
        )
        .then(
          (value) => thenDo(),
        );
  }

  void navigateBack(BuildContext context) {
    Navigator.of(context).pop();
  }

  void navigateBackWithResult(
    BuildContext context,
    Object result,
  ) {
    Navigator.of(context).pop(result);
  }

  void navigateBackTo(
    BuildContext context,
    String routeName,
  ) {
    Navigator.of(context).popUntil((route) => route.settings.name == routeName);
  }

  void navigateAndClearStack(
    BuildContext context,
    String routeName, {
    Object? arguments,
  }) {
    Navigator.of(context).pushNamedAndRemoveUntil(
      routeName,
      (Route<dynamic> route) => route.isFirst,
      arguments: arguments,
    );
  }

  void navigatePushOrReplaceTo(
    BuildContext context,
    String routeName, {
    Object? arguments,
  }) {
    bool shouldReplace = false;

    Navigator.of(context).popUntil((route) {
      if (route.settings.name == routeName) {
        shouldReplace = true;
      }

      return true;
    });

    if (shouldReplace) {
      Navigator.of(context).pushReplacementNamed(
        routeName,
        arguments: arguments,
      );
    } else {
      Navigator.of(context).pushNamed(
        routeName,
        arguments: arguments,
      );
    }
  }
}
