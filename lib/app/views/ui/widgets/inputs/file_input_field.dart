import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'package:flutter_boilerplate/app/utils/input_validator.dart';
import 'package:flutter_boilerplate/app/themes/app_color_themes.dart';

class FileInputField extends StatefulWidget {
  const FileInputField({
    super.key,
    required this.placeholder,
    required this.onChanged,
    this.onSaved,
    this.validator,
    this.prefixIcon,
    this.suffixIcon,
    this.prefixIconColor = AppColorThemes.kLightPrimaryColor,
    this.suffixIconColor = AppColorThemes.kLightPrimaryColor,
    this.enabled = true,
    this.label,
    this.allowMultiple = false,
  });

  final String placeholder;
  final void Function(List<XFile>? files) onChanged;
  final void Function(List<XFile>? files)? onSaved;
  final String? Function(List<XFile>? files)? validator;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final Color? prefixIconColor;
  final Color? suffixIconColor;
  final bool enabled;
  final String? label;
  final bool allowMultiple;

  @override
  State<FileInputField> createState() => _FileInputFieldState();
}

class _FileInputFieldState extends State<FileInputField> {
  List<XFile>? _selectedFiles;
  late final TextEditingController _controller;
  final ImagePicker _picker = ImagePicker();

  @override
  void initState() {
    super.initState();

    _controller = TextEditingController();
  }

  Future<void> _pickFile() async {
    if (!widget.enabled) return;

    List<XFile>? result;
    if (widget.allowMultiple) {
      result = await _picker.pickMultiImage();
    } else {
      final XFile? file = await _picker.pickImage(source: ImageSource.gallery);
      if (file != null) {
        result = [file];
      }
    }

    if (result != null) {
      setState(() {
        _selectedFiles = result;
        _controller.text = widget.allowMultiple
            ? '${_selectedFiles!.length} file(s) selected'
            : _selectedFiles!.first.name;
      });
      widget.onChanged(_selectedFiles);
    }
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
        GestureDetector(
          onTap: _pickFile,
          child: AbsorbPointer(
            child: TextFormField(
              controller: _controller,
              readOnly: true,
              onSaved: (_) => widget.onSaved?.call(_selectedFiles),
              validator: (_) => widget.validator != null
                  ? widget.validator!(_selectedFiles)
                  : InputValidator.validateInput(
                      errorMessage: 'File tidak boleh kosong',
                      value: _selectedFiles?.isNotEmpty == true
                          ? _selectedFiles!.first.name
                          : null,
                    ),
              enabled: widget.enabled,
              cursorColor: Theme.of(context).colorScheme.primary,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                hintText: widget.placeholder,
                suffixIcon: widget.suffixIcon ?? const Icon(Icons.attach_file),
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
