import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../utils/constants/colors.dart';


class DatePickerWidget extends StatefulWidget {
  final void Function(DateTime selectedDate)? onDateSelected;
  final bool allowFutureDate;

  const DatePickerWidget({
    super.key,
    this.onDateSelected,
    this.allowFutureDate = false,
  });

  @override
  State<DatePickerWidget> createState() => _DatePickerWidgetState();
}

class _DatePickerWidgetState extends State<DatePickerWidget> {
  DateTime? _selectedDate;

  Future<void> _pickDate() async {
    final DateTime now = DateTime.now();
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? now,
      firstDate: DateTime(1980),
      lastDate: widget.allowFutureDate ? DateTime(2100) : now,
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: Theme.of(
              context,
            ).colorScheme.copyWith(primary: AppColors.green),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                foregroundColor: AppColors.primaryGreen,
              ),
            ),
          ),
          child: child!,
        );
      },
    );

    if (picked != null) {
      setState(() => _selectedDate = picked);
      widget.onDateSelected?.call(picked);
    }
  }

  @override
  Widget build(BuildContext context) {
    final formattedDate = _selectedDate != null
        ? DateFormat('dd/MM/yyyy').format(_selectedDate!)
        : 'DD/MM/YYYY';

    return GestureDetector(
      onTap: _pickDate,
      child: Container(
        width: double.infinity,
        height: 55,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade300, width: 1.5),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              formattedDate,
              style: Theme.of(context).textTheme.displayMedium,
            ),
            const Icon(
              Icons.calendar_today_outlined,
              color: AppColors.green, // green color
            ),
          ],
        ),
      ),
    );
  }
}