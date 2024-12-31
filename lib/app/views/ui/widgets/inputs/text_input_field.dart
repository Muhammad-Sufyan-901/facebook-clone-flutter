import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_boilerplate/app/utils/input_validator.dart';
import 'package:flutter_boilerplate/app/themes/app_color_themes.dart';

class TextInputField extends StatefulWidget {
  const TextInputField({
    super.key,
    required this.placeholder,
    required this.value,
    required this.onChanged,
    this.onSaved,
    this.validator,
    this.prefixIcon,
    this.suffixIcon,
    this.prefixIconColor = AppColorThemes.kLightPrimaryColor,
    this.suffixIconColor = AppColorThemes.kLightPrimaryColor,
    this.enabled = true,
    this.filterEmote = false,
    this.label,
  });

  final String placeholder;
  final String value;
  final void Function(String value) onChanged;
  final void Function(String? value)? onSaved;
  final String? Function(String? value)? validator;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final Color? prefixIconColor;
  final Color? suffixIconColor;
  final bool? enabled;
  final bool? filterEmote;
  final String? label;

  @override
  State<TextInputField> createState() => _TextInputFieldState();
}

class _TextInputFieldState extends State<TextInputField> {
  late final TextEditingController _controller;

  static List<TextInputFormatter> inputFormatter = [
    FilteringTextInputFormatter.deny(
      RegExp(
        r'[\u{1F600}-\u{1F64F}' // Emoticons
        r'\u{1F300}-\u{1F5FF}' // Misc Symbols and Pictographs
        r'\u{1F680}-\u{1F6FF}' // Transport and Map
        r'\u{1F1E0}-\u{1F1FF}' // Regional Indicator Symbols
        r'\u{2600}-\u{26FF}' // Misc symbols
        r'\u{2700}-\u{27BF}' // Dingbats
        r'\u{FE00}-\u{FE0F}' // Variation Selectors
        r'\u{1F900}-\u{1F9FF}' // Supplemental Symbols and Pictographs
        r'\u{1F018}-\u{1F270}' // Various Asian characters
        r'\u{238C}-\u{2454}' // Misc items
        r'\u{20D0}-\u{20FF}' // Combining Diacritical Marks for Symbols
        r'\u{23CF}-\u{23E9}' // Additional Transport and Map symbols
        ']+',
        unicode: true,
      ),
    ),
  ];

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
              (value) => InputValidator.validateInput(
                    errorMessage: 'Input tidak boleh kosong',
                    value: value,
                  ),
          enabled: widget.enabled,
          cursorColor: Theme.of(context).colorScheme.primary,
          inputFormatters: !widget.filterEmote! ? null : inputFormatter,
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
