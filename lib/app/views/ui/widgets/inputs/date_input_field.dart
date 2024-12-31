import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:flutter_boilerplate/app/themes/app_color_themes.dart';

class DateInputField extends StatefulWidget {
  const DateInputField({
    super.key,
    required this.label,
    required this.initialDate,
    required this.onDatePicked,
  });

  final String label;
  final DateTime initialDate;
  final void Function(DateTime date) onDatePicked;

  @override
  State<DateInputField> createState() => _DateInputFieldState();
}

class _DateInputFieldState extends State<DateInputField> {
  late DateTime _selectedDate = DateTime.now();

  bool _isChanged = false;

  @override
  void initState() {
    super.initState();

    _selectedDate = widget.initialDate;
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(1000),
      lastDate: DateTime(9000),
    );

    if (pickedDate != null && pickedDate != _selectedDate) {
      setState(() {
        _selectedDate = pickedDate;
        _isChanged = true;
      });

      widget.onDatePicked(_selectedDate);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          widget.label,
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: AppColorThemes.kGreyColor(context),
              ),
        ),
        const SizedBox(
          height: 4,
        ),
        InkWell(
          onTap: () => _selectDate(context),
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(
              vertical: 16,
              horizontal: 12,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              border: Border.all(
                color: AppColorThemes.kGreyColor(context),
                width: 0.5,
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  !_isChanged
                      ? 'yyyy-mm-dd'
                      : "${_selectedDate.toLocal()}".split(' ')[0],
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontWeight: FontWeight.w500,
                        color: AppColorThemes.kGreyColor(context),
                      ),
                ),
                const Icon(
                  FontAwesomeIcons.calendarWeek,
                  size: 16,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
