import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_boilerplate/app/themes/app_color_themes.dart';

class NumberInputField extends StatefulWidget {
  const NumberInputField({
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
  final int value;
  final void Function(int value) onChanged;
  final void Function(int? value)? onSaved;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final Color? prefixIconColor;
  final Color? suffixIconColor;
  final bool? enabled;
  final String? label;

  @override
  State<NumberInputField> createState() => _NumberInputFieldState();
}

class _NumberInputFieldState extends State<NumberInputField> {
  late final TextEditingController _controller;

  @override
  void initState() {
    super.initState();

    _controller = TextEditingController(
      text: widget.value.toString(),
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
        Semantics(
          label: widget.label ?? widget.placeholder,
          child: TextFormField(
            controller: _controller,
            onChanged: (value) {
              final intValue = int.tryParse(value) ?? 0;
              widget.onChanged(intValue);
            },
            onSaved: (value) {
              final intValue = int.tryParse(value ?? '') ?? 0;
              widget.onSaved?.call(intValue);
            },
            validator: (value) {
              final intValue = int.tryParse(value ?? '') ?? 0;
              if (intValue == 0) {
                return 'Angka tidak boleh 0';
              }
              return null;
            },
            enabled: widget.enabled,
            cursorColor: Theme.of(context).colorScheme.primary,
            keyboardType: TextInputType.number,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
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
              labelText: widget.label ?? widget.placeholder,
              floatingLabelBehavior: FloatingLabelBehavior.never,
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
