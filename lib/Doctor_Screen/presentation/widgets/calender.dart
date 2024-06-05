import 'package:flutter/material.dart';
import 'package:project/theme/colors.dart';
import 'package:table_calendar/table_calendar.dart';


class CalendarWidget extends StatefulWidget {
  const CalendarWidget({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _CalendarWidgetState createState() => _CalendarWidgetState();
}

class _CalendarWidgetState extends State<CalendarWidget> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  @override
  Widget build(BuildContext context) {
    return TableCalendar(
      firstDay: DateTime.utc(2010, 10, 16),
      lastDay: DateTime.utc(2030, 3, 14),
      focusedDay: _focusedDay,
      calendarFormat: _calendarFormat,
      selectedDayPredicate: (day) {
        return isSameDay(_selectedDay, day);
      },
      onDaySelected: (selectedDay, focusedDay) {
        if (!isSameDay(_selectedDay, selectedDay)) {
          setState(() {
            _selectedDay = selectedDay;
            _focusedDay = focusedDay;
          });
        }
      },
      onFormatChanged: (format) {
        if (_calendarFormat != format) {
          setState(() {
            _calendarFormat = format;
          });
        }
      },
      onPageChanged: (focusedDay) {
        _focusedDay = focusedDay;
      },
      headerStyle: const HeaderStyle(
        titleTextStyle: TextStyle(
          color: AppColors.white,
          fontSize: 20,
          fontWeight: FontWeight.w700,
        ),
        formatButtonVisible: false,
        leftChevronIcon: Icon(
          Icons.chevron_left,
          color: AppColors.white,
        ),
        rightChevronIcon: Icon(
          Icons.chevron_right,
          color: AppColors.white,
        ),
      ),
      calendarStyle: CalendarStyle(
        todayTextStyle: const TextStyle(color: AppColors.white),
        selectedTextStyle: const TextStyle(color: AppColors.white),
        outsideTextStyle: TextStyle(color: AppColors.white.withOpacity(0.5)),
        defaultTextStyle: const TextStyle(color: AppColors.white),
      ),
    );
  }
}
