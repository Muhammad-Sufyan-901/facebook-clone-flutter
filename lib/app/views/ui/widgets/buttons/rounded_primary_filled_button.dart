import 'package:flutter/material.dart';

import 'package:facebook_clone/app/themes/app_color_themes.dart';

class RoundedPrimaryFilledButton extends StatelessWidget {
  const RoundedPrimaryFilledButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.isRounded = true,
    this.height = 48,
  });

  final String label;
  final void Function() onPressed;
  final bool? isRounded;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Theme.of(context).colorScheme.onPrimary,
        minimumSize: Size.fromHeight(height!),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
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
