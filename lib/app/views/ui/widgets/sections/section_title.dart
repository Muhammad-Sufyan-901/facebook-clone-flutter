import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:flutter_boilerplate/app/themes/app_color_themes.dart';

class SectionTitle extends StatelessWidget {
  const SectionTitle({
    super.key,
    required this.title,
    this.icon,
    this.showButton = false,
    this.buttonLabel,
    this.onButtonPressed,
    this.buttonIcon,
  });

  final String title;
  final IconData? icon;
  final bool showButton;
  final String? buttonLabel;
  final IconData? buttonIcon;
  final VoidCallback? onButtonPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        if (icon != null)
          Icon(
            icon!,
            size: 20,
            semanticLabel: 'Section Title Icon',
          ),
        if (icon != null)
          const SizedBox(
            width: 12,
          ),
        Text(
          title,
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
        const Spacer(),
        if (showButton)
          ElevatedButton(
            onPressed: onButtonPressed,
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColorThemes.kPrimaryColor(context),
              padding: const EdgeInsets.symmetric(
                vertical: 4,
                horizontal: 16,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4),
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Icon(
                  buttonIcon ?? FontAwesomeIcons.plus,
                  size: 16,
                  semanticLabel: 'Button Icon',
                  color: Colors.white,
                ),
                const SizedBox(
                  width: 8,
                ),
                Text(
                  buttonLabel ?? 'Add',
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
      ],
    );
  }
}
