import 'package:flutter/material.dart';

import 'package:facebook_clone/app/utils/input_validator.dart';
import 'package:facebook_clone/app/themes/app_color_themes.dart';

class DropdownInputField<T> extends StatefulWidget {
  const DropdownInputField({
    super.key,
    required this.placeholder,
    required this.value,
    required this.onChanged,
    required this.items,
    this.onSaved,
    this.validator,
    this.prefixIcon,
    this.suffixIcon,
    this.prefixIconColor = AppColorThemes.kLightPrimaryColor,
    this.suffixIconColor = AppColorThemes.kLightPrimaryColor,
    this.enabled = true,
    this.label,
  });

  final String placeholder;
  final T? value;
  final void Function(T? value) onChanged;
  final void Function(T? value)? onSaved;
  final String? Function(T? value)? validator;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final Color? prefixIconColor;
  final Color? suffixIconColor;
  final bool? enabled;
  final String? label;
  final List<DropdownMenuItem<T>> items;

  @override
  State<DropdownInputField<T>> createState() => _DropdownInputFieldState<T>();
}

class _DropdownInputFieldState<T> extends State<DropdownInputField<T>> {
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
        DropdownButtonFormField<T>(
          value: widget.value,
          onChanged: widget.enabled! ? widget.onChanged : null,
          onSaved: widget.onSaved,
          validator: widget.validator ??
              (value) => InputValidator.validateInput(
                    errorMessage: 'Input tidak boleh kosong',
                    value: value?.toString(),
                  ),
          items: widget.items,
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
            alignLabelWithHint: true,
            isDense: true,
          ),
          dropdownColor: Colors.white,
          isExpanded: true,
          iconSize: 24,
          elevation: 16,
        ),
      ],
    );
  }
}
