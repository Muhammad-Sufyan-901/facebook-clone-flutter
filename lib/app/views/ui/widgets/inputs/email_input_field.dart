import 'package:flutter/material.dart';

import 'package:flutter_boilerplate/app/utils/input_validator.dart';
import 'package:flutter_boilerplate/app/themes/app_color_themes.dart';

class EmailInputField extends StatefulWidget {
  const EmailInputField({
    super.key,
    required this.placeholder,
    required this.value,
    required this.onChanged,
    this.onSaved,
    this.prefixIcon,
    this.suffixIcon,
    this.prefixIconColor = AppColorThemes.kLightPrimaryColor,
    this.suffixIconColor = AppColorThemes.kLightPrimaryColor,
    this.enabled = true,
    this.label,
  });

  final String placeholder;
  final String value;
  final void Function(String value) onChanged;
  final void Function(String? value)? onSaved;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final Color? prefixIconColor;
  final Color? suffixIconColor;
  final bool? enabled;
  final String? label;

  @override
  State<EmailInputField> createState() => _EmailInputFieldState();
}

class _EmailInputFieldState extends State<EmailInputField> {
  late final TextEditingController _controller;

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
          validator: (value) => InputValidator.validateEmail(value),
          enabled: widget.enabled,
          cursorColor: Theme.of(context).colorScheme.primary,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            hintText: widget.placeholder,
            suffixIcon: widget.suffixIcon,
            prefixIcon: widget.prefixIcon,
            suffixIconColor: widget.suffixIconColor,
            prefixIconColor: widget.prefixIconColor,
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
