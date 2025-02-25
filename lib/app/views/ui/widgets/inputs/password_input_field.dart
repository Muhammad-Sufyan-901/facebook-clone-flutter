import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:facebook_clone/app/utils/input_validator.dart';
import 'package:facebook_clone/app/themes/app_color_themes.dart';

class PasswordInputField extends StatefulWidget {
  const PasswordInputField({
    super.key,
    required this.placeholder,
    required this.value,
    required this.onChanged,
    this.onSaved,
    this.validator,
    this.prefixIcon,
    this.prefixIconColor = AppColorThemes.kLightPrimaryColor,
    this.enabled = true,
    this.label,
  });

  final String placeholder;
  final String value;
  final void Function(String value) onChanged;
  final void Function(String? value)? onSaved;
  final String? Function(String? value)? validator;
  final Widget? prefixIcon;
  final Color? prefixIconColor;
  final bool? enabled;
  final String? label;

  @override
  State<PasswordInputField> createState() => _PasswordInputFieldState();
}

class _PasswordInputFieldState extends State<PasswordInputField> {
  late final TextEditingController _controller;
  bool _obscureText = true;

  @override
  void initState() {
    super.initState();

    _controller = TextEditingController(
      text: widget.value,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        if (widget.label != null)
          Padding(
            padding: const EdgeInsets.only(
              bottom: 8,
            ),
            child: Text(
              widget.label!,
              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    color: AppColorThemes.kGreyColor(context),
                  ),
            ),
          ),
        TextFormField(
          controller: _controller,
          onChanged: widget.onChanged,
          onSaved: widget.onSaved,
          validator: widget.validator ??
              (value) => InputValidator.validatePassword(value),
          enabled: widget.enabled,
          obscureText: _obscureText,
          cursorColor: Theme.of(context).colorScheme.primary,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            hintText: widget.placeholder,
            prefixIcon: widget.prefixIcon,
            prefixIconColor: widget.prefixIconColor,
            suffixIcon: IconButton(
              icon: Icon(
                _obscureText ? FontAwesomeIcons.eyeSlash : FontAwesomeIcons.eye,
                size: 18,
                color: AppColorThemes.kPrimaryColor(context),
                semanticLabel: 'Show password',
              ),
              onPressed: () {
                setState(() {
                  _obscureText = !_obscureText;
                });
              },
            ),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 12,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6),
              borderSide: BorderSide(
                color: Colors.grey.shade300,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6),
              borderSide: BorderSide(
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _controller.dispose();

    super.dispose();
  }
}
