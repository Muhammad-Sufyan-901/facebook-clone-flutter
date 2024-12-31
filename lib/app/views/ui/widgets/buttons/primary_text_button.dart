import 'package:flutter/material.dart';

class PrimaryTextButton extends StatelessWidget {
  const PrimaryTextButton({
    super.key,
    required this.onPressed,
    required this.label,
    this.isHighlighted = false,
  });

  final VoidCallback onPressed;
  final String label;
  final bool? isHighlighted;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        'Forgot Password?',
        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              fontWeight: isHighlighted! ? FontWeight.w600 : FontWeight.w400,
              color: Theme.of(context).colorScheme.primary,
            ),
      ),
    );
  }
}
