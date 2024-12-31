import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:flutter_boilerplate/app/utils/input_validator.dart';
import 'package:flutter_boilerplate/app/themes/app_color_themes.dart';

class RoundedPasswordInputField extends StatefulWidget {
  const RoundedPasswordInputField({
    super.key,
    required this.placeholder,
    required this.value,
    required this.onChanged,
    this.onSaved,
    this.validator,
    this.prefixIcon,
    this.prefixIconColor = AppColorThemes.kLightPrimaryColor,
    this.suffixIconColor = AppColorThemes.kLightPrimaryColor,
    this.enabled = true,
    this.filterEmote = true,
    this.fillColor = AppColorThemes.kLightFillColor,
    this.placeholderColor,
  });

  final String placeholder;
  final String value;
  final void Function(String value) onChanged;
  final void Function(String? value)? onSaved;
  final String? Function(String? value)? validator;
  final Widget? prefixIcon;
  final Color? prefixIconColor;
  final Color? suffixIconColor;
  final bool? enabled;
  final bool? filterEmote;
  final Color? fillColor;
  final Color? placeholderColor;

  @override
  State<RoundedPasswordInputField> createState() =>
      _RoundedPasswordInputFieldState();
}

class _RoundedPasswordInputFieldState extends State<RoundedPasswordInputField> {
  late final TextEditingController _controller;
  bool _visiblePassword = false;

  void _togglePasswordVisibility() {
    setState(() {
      _visiblePassword = !_visiblePassword;
    });
  }

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
    return TextFormField(
      controller: _controller,
      obscureText: !_visiblePassword,
      onChanged: widget.onChanged,
      onSaved: widget.onSaved,
      validator:
          widget.validator ?? (value) => InputValidator.validatePassword(value),
      enabled: widget.enabled,
      cursorColor: Theme.of(context).colorScheme.primary,
      inputFormatters: !widget.filterEmote! ? null : inputFormatter,
      decoration: InputDecoration(
        filled: widget.fillColor != null,
        fillColor: widget.fillColor,
        hintText: widget.placeholder,
        prefixIcon: widget.prefixIcon,
        suffixIcon: GestureDetector(
          onTap: _togglePasswordVisibility,
          child: Icon(
            _visiblePassword ? FontAwesomeIcons.eyeSlash : FontAwesomeIcons.eye,
            size: 16,
            semanticLabel: 'Toggle Password Visibility',
          ),
        ),
        prefixIconColor: widget.prefixIconColor,
        suffixIconColor: widget.suffixIconColor,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 24,
          vertical: 16,
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(50),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();

    _controller.text = widget.value;

    _controller.clear();
    _controller.dispose();
  }
}
