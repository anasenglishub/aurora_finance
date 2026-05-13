import 'package:aurora_finance/app/view/widgets/UI/custom_input_widget.dart';
import 'package:flutter/material.dart';
import 'package:aurora_finance/app/shared/utils/app_config.dart';
import 'package:intl/intl.dart';
import 'package:aurora_finance/app/shared/enums/date_picker_format.dart';

class MonthPickerInput extends StatefulWidget {
  final String? labelText;
  final String? hintText;
  final DateTime? initialDate;
  final ValueChanged<DateTime>? onDateSelected;
  final DateTime? firstDate;
  final DateTime? lastDate;
  final TextEditingController? controller;  // ← NEW: Optional external controller
  final DatePickerFormat format;  // ← NEW: Format for the date picker

  const MonthPickerInput({
    super.key,
    this.labelText,
    this.hintText,
    this.initialDate,
    this.onDateSelected,
    this.firstDate,
    this.lastDate,
    this.controller,  // ← NEW
    this.format = DatePickerFormat.monthYear,  // ← NEW
  });

  @override
  State<MonthPickerInput> createState() => _MonthPickerInputState();
}

class _MonthPickerInputState extends State<MonthPickerInput> {
  TextEditingController? _internalController;  // ← Only used if no external controller
  late TextEditingController _effectiveController;  // ← The one we actually use
  DateTime? _selectedDate;

  @override
  void initState() {
    super.initState();
    _selectedDate = widget.initialDate;
    
    // Use external controller if provided, otherwise create internal one
    if (widget.controller != null) {
      _effectiveController = widget.controller!;
      // Set initial text on external controller
      if (_selectedDate != null && widget.controller!.text.isEmpty) {
        widget.controller!.text = DateFormat(widget.format == DatePickerFormat.fullDate ? 'dd/MM/yyyy' : 'MMMM yyyy').format(_selectedDate!);
      }
    } else {
      _internalController = TextEditingController(
        text: _selectedDate != null ? 
        DateFormat(widget.format == DatePickerFormat.fullDate ? 'dd/MM/yyyy' : 'MMMM yyyy').format(_selectedDate!) : 
        '',
      );
      _effectiveController = _internalController!;
    }
  }

  @override
  void dispose() {
    // Only dispose if we created it internally
    _internalController?.dispose();
    super.dispose();
  }

  Future<void> _showDatePicker() async {
    final now = DateTime.now();
    final picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? now,
      firstDate: widget.firstDate ?? DateTime(now.year - 5),
      lastDate: widget.lastDate ?? DateTime(now.year + 5),
      initialDatePickerMode: widget.format == DatePickerFormat.fullDate 
        ? DatePickerMode.day 
        : DatePickerMode.year,
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: AppConfig.primarySwatch,
              onPrimary: Colors.white,
              surface: Colors.white,
              onSurface: AppConfig.neutralSwatch[500]!,
            ),
          ),
          child: child!,
        );
      },
    );

    if (picked != null) {
      setState(() {
        _selectedDate = widget.format == DatePickerFormat.fullDate 
            ? picked 
            : DateTime(picked.year, picked.month);
        _effectiveController.text = DateFormat(widget.format == DatePickerFormat.fullDate ? 'dd/MM/yyyy' : 'MMMM yyyy').format(picked);
      });
      widget.onDateSelected?.call(_selectedDate!);
    }
  }

  void _onTextChanged(String value) {
    final parsed = _tryParseMonth(value);
    if (parsed != null) {
      setState(() {
        _selectedDate = parsed;
      });
      widget.onDateSelected?.call(parsed);
    }
  }

  DateTime? _tryParseMonth(String input) {
    input = input.trim();
    if (input.isEmpty) return null;

    final formats = [
      DateFormat('dd/MM/yyyy'),
      DateFormat('MMMM yyyy'),
      DateFormat('MMM yyyy'),
      DateFormat('MM/yyyy'),
      DateFormat('MM-yyyy'),
    ];

    for (final format in formats) {
      try {
        return format.parseStrict(input);
      } catch (_) {}
    }

    final monthNames = [
      'january', 'february', 'march', 'april', 'may', 'june',
      'july', 'august', 'september', 'october', 'november', 'december',
      'jan', 'feb', 'mar', 'apr', 'may', 'jun',
      'jul', 'aug', 'sep', 'oct', 'nov', 'dec',
    ];

    final lower = input.toLowerCase();
    for (int i = 0; i < monthNames.length; i++) {
      if (lower.contains(monthNames[i])) {
        final monthIndex = (i % 12) + 1;
        final year = DateTime.now().year;
        final yearMatch = RegExp(r'\b(20\d{2})\b').firstMatch(input);
        final parsedYear = yearMatch != null ? int.parse(yearMatch.group(1)!) : year;
        return DateTime(parsedYear, monthIndex);
      }
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    final hintText = widget.format == DatePickerFormat.monthYear 
        ? 'e.g., January 2025' 
        : 'e.g., 10/01/2025';

    return CustomInputWidget(
      controller: _effectiveController,  // ← Use effective controller
      hintText: widget.hintText ?? hintText,
      labelText: widget.labelText,
      onTextChanged: _onTextChanged,
      suffixIcon: Container(
        margin: const EdgeInsets.only(right: 8),
        child: IconButton(
          icon: Icon(
            Icons.calendar_today,
            color: AppConfig.primarySwatch,
            size: 20,
          ),
          onPressed: _showDatePicker,
          tooltip: 'Select from calendar',
        ),
      ),
    );
  }
}