import 'package:flutter/material.dart';

import 'package:facebook_clone/app/themes/app_color_themes.dart';

class PrimaryFilledButton extends StatelessWidget {
  const PrimaryFilledButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.isRounded = true,
    this.isElevated = false,
    this.height = 48,
  });

  final String label;
  final void Function() onPressed;
  final bool? isRounded;
  final bool? isElevated;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        elevation: isElevated! ? 5 : 0,
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Theme.of(context).colorScheme.onPrimary,
        minimumSize: Size.fromHeight(height!),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
        ),
      ),
      child: Text(
        label,
        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              fontWeight: FontWeight.w600,
              color: AppColorThemes.kTextColor(context),
            ),
      ),
    );
  }
}
